class RndmWordService {
  static final RndmWordService _instance = RndmWordService._internal();

  // passes the instantiation to the _instance object
  factory RndmWordService() => _instance;

  //initialize variables in here
  RndmWordService._internal() {
    List<String> _rndmWordList = <String>[];
    Set<String> _validSet = Set<String>();
    Set<String> _weirdSet = Set<String>();

    String ayatBI_i = "Panther and Leo are ";
    String ayatBI_ii = " cats!";
    String ayatBM_i = "Panther dan Leo adalah kucing yang ";
    String ayatBM_ii = "";
  }

  //declare variable ---
  final List<String> _rndmWordList = <String>[];
  final Set<String> _validSet = Set<String>();
  final Set<String> _weirdSet = Set<String>();

  String ayatBI_i = "Panther and Leo are ";
  String ayatBI_ii = " cats!";
  String ayatBM_i = "Panther dan Leo adalah kucing yang ";
  String ayatBM_ii = "";

  //short getter for my variable
  List<String> get myRndmWordList => _rndmWordList;
  Set<String> get myValidSet => _validSet;
  Set<String> get myWeirdSet => _weirdSet;

  //short setter for my variable

  void addRndmWordList(String value) {
    _rndmWordList.add(value);
  }

  void addWeirdList(String value) {
    _weirdSet.add(value);
  }

  void addValidList(String value) {
    _validSet.add(value);
  }

  void removeWeirdList(String value) {
    _weirdSet.remove(value);
  }

  void removeValidList(String value) {
    _validSet.remove(value);
  }

  void setAyatBIi(String value) {
    ayatBI_i = value;
  }

  void setAyatBIii(String value) {
    ayatBI_ii = value;
  }

  void setAyatBMi(String value) {
    ayatBM_i = value;
  }

  void setAyatBMii(String value) {
    ayatBM_ii = value;
  }
}
