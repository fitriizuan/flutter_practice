import 'package:flutter/material.dart';
import 'package:kata_rawak_ii/tab_merge.dart';
//import 'package:google_translator/google_translator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(KataRawakii());
}

class KataRawakii extends StatelessWidget {
  //final String apiKey = "AIzaSyCc7wKGA-HdtaBFkvs2QPzALKgS6eWQ6QA";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kata Rawak ii',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TabMerger(),
    );
  }
}
