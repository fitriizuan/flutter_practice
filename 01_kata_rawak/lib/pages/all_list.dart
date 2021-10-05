import 'package:flutter/material.dart';
import 'package:kata_rawak_ii/rndm_word_service.dart';
import 'package:kata_rawak_ii/pages/tukar_ayat.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:google_translator/google_translator.dart';

class AllList extends StatefulWidget {
  @override
  _AllListState createState() => _AllListState();
}

class _AllListState extends State<AllList>
    with AutomaticKeepAliveClientMixin<AllList> {
  //for google translator API Key
  final String apiKey = "AIzaSyCc7wKGA-HdtaBFkvs2QPzALKgS6eWQ6QA";

  @override
  void initState() {
    super.initState();
    print('initState AllList');
  }

  Random random = Random();
  int randomNo = 0;
  String _randomWord = "";

  final RndmWordService _myRndmWordService = RndmWordService();

  void _addSentence() {
    setState(() {
      randomNo = random.nextInt(adjectives.length);
      _randomWord = adjectives[randomNo].toString();
      _myRndmWordService.addRndmWordList(_randomWord);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('All List Tab');
    return GoogleTranslatorInit(apiKey,
        translateFrom: const Locale('en'),
        translateTo: const Locale('ms'),
        // automaticDetection: , In case you don't know the user language
        builder: () => Scaffold(
              appBar: AppBar(
                title: const Text('Senarai Semua Ayat'),
                titleTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                backgroundColor: Colors.white54,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _myRndmWordService.myValidSet.clear();
                        _myRndmWordService.myWeirdSet.clear();
                        _myRndmWordService.myRndmWordList.clear();
                      });
                    },
                    icon: const Icon(Icons.delete_forever_sharp),
                    tooltip: "Padam Semua Senarai",
                    color: Colors.red,
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeSentence()));
                    },
                    icon: const Icon(Icons.settings),
                    tooltip: "Tukar Ayat",
                    color: Colors.black,
                    iconSize: 40,
                  ),
                ],
              ),
              body: _homeBody(),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: _addSentence,
                tooltip: 'Tambah Ayat',
                icon: const Icon(
                  Icons.plus_one_rounded,
                  //color: Colors.white70,
                ),
                label: const Text("Tambah"),
                backgroundColor: Colors.black87,
                //foregroundColor: Colors.black,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ));
  }

  Widget _homeBody() {
    if (_myRndmWordService.myRndmWordList.isNotEmpty) {
      return _hasData();
    } else {
      return _noData();
    }
  }

  //if there is no Data yet, return this UI ------>
  Widget _noData() {
    return Builder(
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              'Tiada Senarai!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              'Sila Klik Butang Tambah Di Bawah Untuk Tambah Ayat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  } //if there is no Data yet, return this UI <------

  //if Data exists, return this UI ------>
  Widget _hasData() {
    return ListView.builder(
      //padding: const EdgeInsets.all(1.0),
      padding:
          const EdgeInsets.only(bottom: 60.0, top: 2.0, left: 1.0, right: 1.0),
      itemCount: _myRndmWordService.myRndmWordList.length,
      itemBuilder: (BuildContext context, int index) {
        return _myCard(index);
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),  //for separated ListView
    );
  }

  //this is Card Widget ------>
  Widget _myCard(int index) {
    final _isValid = _myRndmWordService.myValidSet
        .contains(_myRndmWordService.myRndmWordList[index]);
    final _isWeird = _myRndmWordService.myWeirdSet
        .contains(_myRndmWordService.myRndmWordList[index]);

    return Card(
        color: Colors.blue[50],
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: <Widget>[
              Flexible(
                  fit: FlexFit.loose,
                  child: Wrap(
                    alignment: WrapAlignment.center, //can be .start, .end
                    children: [
                      Text(_myRndmWordService.ayatBI_i),
                      Text(
                        _myRndmWordService.myRndmWordList[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(_myRndmWordService.ayatBI_ii),
                      const Divider(
                        color: Colors.white,
                        indent: 25,
                      ),
                      Text(_myRndmWordService.ayatBM_i),
                      Text(_myRndmWordService.myRndmWordList[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic))
                          .translate(),
                      Text(_myRndmWordService.ayatBM_ii),
                    ],
                  )),
              Container(
                  width: 50,
                  padding: const EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  //color: Colors.red,
                  child: IconButton(
                    icon: Icon(
                      _isValid
                          ? Icons.sentiment_very_satisfied_rounded
                          : _isWeird
                              ? Icons.sentiment_very_dissatisfied_rounded
                              : Icons.sentiment_neutral_rounded,
                      size: 30,
                      color: _isValid
                          ? Colors.green
                          : _isWeird
                              ? Colors.red
                              : null,
                    ),
                    tooltip:
                        "Tap to Verify the Sentence Valid (green)/Weird (red)",
                    onPressed: () {
                      setState(() {
                        if (_isValid) {
                          _myRndmWordService.removeValidList(
                              _myRndmWordService.myRndmWordList[index]);
                          _myRndmWordService.addWeirdList(
                              _myRndmWordService.myRndmWordList[index]);
                        } else if (_isWeird) {
                          _myRndmWordService.removeWeirdList(
                              _myRndmWordService.myRndmWordList[index]);
                        } else {
                          _myRndmWordService.addValidList(
                              _myRndmWordService.myRndmWordList[index]);
                        }
                      });
                    },
                  ))
            ],
          ),
        ));
  }
  //if Data exists, return this Card Widget <-------

  @override
  bool get wantKeepAlive => true;
}
