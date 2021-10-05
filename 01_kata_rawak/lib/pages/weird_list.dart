import 'package:flutter/material.dart';
import 'package:kata_rawak_ii/rndm_word_service.dart';
import 'package:google_translator/google_translator.dart';

class WeirdList extends StatefulWidget {
  @override
  _WeirdListState createState() => _WeirdListState();
}

class _WeirdListState extends State<WeirdList>
    with AutomaticKeepAliveClientMixin<WeirdList> {
  //for google translator API Key
  final String apiKey = "AIzaSyCc7wKGA-HdtaBFkvs2QPzALKgS6eWQ6QA";

  @override
  void initState() {
    super.initState();
    print('initState WeirdList');
  }

  final RndmWordService _myRndmWordService = RndmWordService();

  @override
  Widget build(BuildContext context) {
    //print('build WeirdList');
    return GoogleTranslatorInit(apiKey,
        translateFrom: const Locale('en'),
        translateTo: const Locale('ms'),
        // automaticDetection: , In case you don't know the user language
        builder: () => Scaffold(
            appBar: AppBar(
              title: const Text('Senarai Ayat Yang Salah'),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white54,
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      _myRndmWordService.myWeirdSet.clear();
                    });
                  },
                  icon: const Icon(Icons.delete_forever_sharp),
                  tooltip: "Padam Senarai Ayat Yang Salah",
                  color: Colors.red,
                  iconSize: 40,
                ),
              ],
            ),
            body: _homeBody()));
  }

  Widget _homeBody() {
    if (_myRndmWordService.myWeirdSet.isNotEmpty) {
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
              'Tiada Lagi Senarai Bagi Ayat Yang Salah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              'Sila Pilih Dari Semua Senarai Ayat untuk dimasukkan ke Senarai Ayat Yang Salah',
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

  Widget _hasData() {
    return ListView.builder(
      //padding: const EdgeInsets.all(1.0),
      padding:
          const EdgeInsets.only(bottom: 10.0, top: 2.0, left: 1.0, right: 1.0),
      itemCount: _myRndmWordService.myWeirdSet.length,
      itemBuilder: (BuildContext context, int index) {
        return _myCard(index);
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),  //for separated ListView
    );
  }

  //this is Card Widget ------>
  Widget _myCard(int index) {
    return Card(
        color: Colors.red[50],
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
                      Text(_myRndmWordService.ayatBM_ii), //.translate()
                    ],
                  )),
            ],
          ),
        ));
  }
  //if Data exists, return this Card Widget <-------

  @override
  bool get wantKeepAlive => true;
}
