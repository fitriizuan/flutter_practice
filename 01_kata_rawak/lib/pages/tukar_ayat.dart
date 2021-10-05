import 'package:flutter/material.dart';
import 'package:kata_rawak_ii/rndm_word_service.dart';

class ChangeSentence extends StatefulWidget {
  @override
  _ChangeSentenceState createState() => _ChangeSentenceState();
}

class _ChangeSentenceState extends State<ChangeSentence> {
  @override
  void initState() {
    super.initState();
    print('initState Tukar Ayat');
  }

  final RndmWordService _myRndmWordService = RndmWordService();
  final ayatBIi_controller = TextEditingController();
  final ayatBIii_controller = TextEditingController();
  final ayatBMi_controller = TextEditingController();
  final ayatBMii_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build WeirdList');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tukar Ayat'),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white54,
        ),
        body: _konten());
  }

  //if there is no Data yet, return this UI ------>
  Widget _konten() {
    return ListView.builder(
      //padding: const EdgeInsets.all(1.0),
      padding:
          const EdgeInsets.only(bottom: 10.0, top: 2.0, left: 1.0, right: 1.0),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_sharp,
                      color: Colors.black45,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)),
                    //labelText: "1st Sentence:",
                    filled: true,
                    fillColor: const Color.fromRGBO(252, 252, 252, 1),
                    hintText: _myRndmWordService.ayatBI_i,
                    hintStyle: const TextStyle(color: Colors.black87),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.text,
                autofocus: true,
                cursorColor: Colors.black87,
                cursorWidth: 3.0,
                style: const TextStyle(color: Colors.black87),
                controller: ayatBIi_controller,
              ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)),
                    prefixIcon: const Icon(Icons.text_rotation_none_sharp,
                        color: Colors.black45),
                    //labelText: "2nd Sentence:",
                    filled: true,
                    fillColor: const Color.fromRGBO(252, 252, 252, 1),
                    hintText: _myRndmWordService.ayatBI_ii,
                    hintStyle: const TextStyle(color: Colors.black87),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                cursorColor: Colors.black87,
                cursorWidth: 3.0,
                style: const TextStyle(color: Colors.black87),
                controller: ayatBIii_controller,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose,
                      child: Wrap(
                        alignment: WrapAlignment.center, //can be .start, .end
                        children: [
                          Text(
                            _myRndmWordService.ayatBI_i,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "'Random Adjective Word'",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                fontSize: 18),
                          ),
                          Text(_myRndmWordService.ayatBI_ii,
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              // ------------------------------------ 2nd Part -------------------------------------
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Divider(
                color: Colors.black,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)),
                    prefixIcon: const Icon(Icons.text_rotation_none_sharp,
                        color: Colors.black45),
                    //labelText: "Ayat Pertama:",
                    filled: true,
                    fillColor: const Color.fromRGBO(252, 252, 252, 1),
                    hintText: _myRndmWordService.ayatBM_i,
                    hintStyle: const TextStyle(
                      color: Colors.black87,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.text,
                autofocus: true,
                cursorColor: Colors.black87,
                cursorWidth: 3.0,
                style: const TextStyle(color: Colors.black87),
                controller: ayatBMi_controller,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)),
                    prefixIcon: const Icon(Icons.text_rotation_none_sharp,
                        color: Colors.black45),
                    //labelText: "Ayat Kedua:",
                    filled: true,
                    fillColor: const Color.fromRGBO(252, 252, 252, 1),
                    hintText: _myRndmWordService.ayatBM_ii,
                    hintStyle: const TextStyle(color: Colors.black87),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                cursorColor: Colors.black87,
                cursorWidth: 3.0,
                style: const TextStyle(color: Colors.black87),
                controller: ayatBMii_controller,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose,
                      child: Wrap(
                        alignment: WrapAlignment.center, //can be .start, .end
                        children: [
                          Text(_myRndmWordService.ayatBM_i,
                              style: const TextStyle(fontSize: 20)),
                          const Text(
                            "'Kata Sifat Rawak'",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                fontSize: 18),
                          ),
                          Text(_myRndmWordService.ayatBM_ii,
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Divider(
                color: Colors.black,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _myRndmWordService
                            .setAyatBIi(ayatBIi_controller.text + " ");
                        _myRndmWordService
                            .setAyatBIii(" " + ayatBIii_controller.text);
                        _myRndmWordService
                            .setAyatBMi(ayatBMi_controller.text + " ");
                        _myRndmWordService
                            .setAyatBMii(" " + ayatBMii_controller.text);
                      });
                    }, //later change to change Default Sentences set
                    child: const Text(
                      'Tukar Ayat',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        padding: const EdgeInsets.all(15)
                        //fixedSize:
                        ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(),  //for separated ListView
    );
  }
}
