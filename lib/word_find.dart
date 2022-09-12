import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_search/word_search.dart';

class WordFind extends StatefulWidget {
  const WordFind({Key? key}) : super(key: key);

  @override
  State<WordFind> createState() => _WordFindState();
}

class _WordFindState extends State<WordFind> {
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();
  final _firestore = FirebaseFirestore.instance;

  late DatabaseReference _dbref;
  String databasejson = '';

  // _readdb_onechild() {
  //   _dbref
  //       .child("customer1")
  //       .child("age")
  //       .once()
  //       .then((DataSnapshot dataSnapshot) {
  //     print(" read once - " + dataSnapshot.value.toString());
  //     setState(() {
  //       databasejson = dataSnapshot.value.toString();
  //     });
  //   });
  // }

  late List<WordFindQues> listQuestions;

  @override
  void initState() {
    _dbref = FirebaseDatabase.instance.reference();
    //_readdb_onechild();
    listQuestions = [
      WordFindQues(
          question:
              'Verilere, bilgisayar sistemlerine veya ağlara yetkisiz bir şekilde erişildiği veya etkilendiği bir olay.',
          answer: "İhlal"),
      WordFindQues(
          question:
              "İnternete bağlı virüslü cihazlardan oluşan bir ağ, sahiplerinin bilgisi olmadan koordineli siber saldırılar yapmak için kullanılır",
          answer: "Botnet"),
      WordFindQues(
          question:
              "Bilgilerini değiştirmek, yok etmek, çalmak veya devre dışı bırakmak amacıyla bilgisayar sistemlerinden yararlanmaya çalışan kötü niyetli aktör.",
          answer: "Saldırgan"),
      WordFindQues(
          question:
              "Kötü amaçlı yazılımları tespit etmek ve kaldırmak için tasarlanmış bir program",
          answer: "Antivirüs"),
      WordFindQues(
          question:
              "SMS yoluyla kimlik avı: Kullanıcılara hassas bilgiler (ör. banka bilgileri) soran veya onları sahte bir web sitesini ziyaret etmeye teşvik eden toplu metin mesajları.",
          answer: "Smishing"),
      WordFindQues(
          question:
              "Kendi kendini kopyalayabilen ve meşru yazılım programlarına veya sistemlerine bulaşmak üzere tasarlanmış programlar. Bir tür kötü amaçlı yazılım.",
          answer: "Virüs"),
      WordFindQues(
          question:
              "Yetkisiz erişim, verilerin yok edilmesi, ifşa edilmesi, değiştirilmesi ve/veya hizmet reddi yoluyla bir varlığı olumsuz etkileme potansiyeli olan herhangi bir durum veya olay.",
          answer: "Tehdit"),
      WordFindQues(
          question:
              "Kötü amaçlı yazılımları tespit etmek ve kaldırmak için tasarlanmış bir program",
          answer: "Antivirüs"),
      WordFindQues(
          question:
              "Saldırıları, potansiyel kurbanları kimlik bilgileri veya banka ve kredi kartı bilgileri gibi hassas bilgileri ifşa etmeye ikna etmenin bir yoludur.",
          answer: "Oltalama")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference personelRef = _firestore.collection('0');
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    color: Colors.white60,
                    child: WordFindWidget(constraints.biggest,
                        listQuestions.map((ques) => ques.clone()).toList(),
                        key: globalKey),
                  );
                },
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    globalKey.currentState?.generatePuzzle(
                        loop:
                            listQuestions.map((ques) => ques.clone()).toList());
                  },
                  child: Text(
                    "YENİDEN YÜKLE",
                    style: GoogleFonts.openSans(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

//Word Find Widget statefull
class WordFindWidget extends StatefulWidget {
  final Size size;
  final List<WordFindQues> listQuestions;
  const WordFindWidget(this.size, this.listQuestions, {Key? key})
      : super(key: key);

  @override
  State<WordFindWidget> createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  late Size size;
  late List<WordFindQues> listQuestions;
  int indexQues = 0; //curr index
  int hintCount = 0;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions[indexQues];
    print(currentQues);
    print("debene");
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => generateHint(),
                  child: Icon(
                    color: Colors.yellow.shade700,
                    Icons.lightbulb,
                    size: 45,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => generatePuzzle(left: true),
                      child: Icon(
                        color: Colors.yellow.shade700,
                        Icons.arrow_back_ios,
                        size: 45,
                      ),
                    ),
                    InkWell(
                      onTap: () => generatePuzzle(next: true),
                      child: Icon(
                        color: Colors.yellow.shade700,
                        Icons.arrow_forward_ios,
                        size: 45,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade900, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(35),
              alignment: Alignment.center,
              child: Text(
                "${currentQues.question ?? ''}",
                style: GoogleFonts.exo2(fontSize: 17, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.up,
                children: currentQues.puzzles.map((puzzle) {
                  Color? color;
                  if (currentQues.isDone)
                    color = Colors.green[300];
                  else if (puzzle.hintShow)
                    color = Colors.yellow[100];
                  else if (currentQues.isFull)
                    color = Colors.red;
                  else
                    color = Colors.white;

                  return InkWell(
                    onTap: () {
                      if (puzzle.hintShow || currentQues.isDone) return;

                      currentQues.isFull = false;
                      puzzle.clearValue();
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.blue.shade900),
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: constraints.biggest.width / 11,
                      height: constraints.biggest.width / 8,
                      margin: EdgeInsets.all(3),
                      child: Text("${puzzle.currentValue ?? ''}".toUpperCase()),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 8,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemCount: 16, //sonra degisebilir
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool statusBtn = currentQues.puzzles.indexWhere(
                            (puzzle) => puzzle.currentIndex == index) >=
                        0;

                    return LayoutBuilder(builder: (context, constraints) {
                      Color? color =
                          statusBtn ? Colors.white70 : Colors.blueAccent[100];

                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text(
                            "${currentQues.arrayBtns[index]}".toUpperCase(),
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          onPressed: () {
                            if (!statusBtn) setBtnClick(index);
                          },
                        ),
                      );
                    });
                  })),
        ],
      ),
    );
  }

  void generatePuzzle(
      {List<WordFindQues>? loop, bool next: false, bool left: false}) {
    if (loop != null) {
      indexQues = 0;
      this.listQuestions = <WordFindQues>[];
      this.listQuestions.addAll(loop);
    } else {
      if (next && indexQues < listQuestions.length - 1)
        indexQues++;
      else if (left && indexQues > 0)
        indexQues--;
      else if (indexQues >= listQuestions.length - 1) return;

      setState(() {});
      if (this.listQuestions[indexQues].isDone) return;
    }
    WordFindQues currentQues = listQuestions[indexQues];
    setState(() {});

    final List<String> w1 = [currentQues.answer];

    final WSSettings ws = WSSettings(
        width: 16,
        height: 1,
        orientations: List.from([WSOrientation.horizontal]));

    final WordSearch wordSearch = WordSearch();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(w1, ws);

    //hata olup olmadığını kontrol, rastgele kelime oluşturmak
    if (newPuzzle.errors.isEmpty) {}
    currentQues.arrayBtns = newPuzzle.puzzle.expand((list) => list).toList();
    currentQues.arrayBtns.shuffle();

    bool isDone = currentQues.isDone;
    if (!isDone) {
      currentQues.puzzles = List.generate(w1[0].split("").length, (index) {
        return WordFindChar(correctValue: currentQues.answer.split("")[index]);
      });
    }
    hintCount = 0;
    setState(() {});
  }

  generateHint() async {
    // harf lutfen
    WordFindQues currentQues = listQuestions[indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.length > 0) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      // tamalama kontrol

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
}

class WordFindQues {
  late String question;
  //String? pathImage;
  late String answer;

  bool isDone = false;
  bool isFull = false;

  List<WordFindChar> puzzles = <WordFindChar>[];
  List<String> arrayBtns = <String>[];

  WordFindQues({required this.question, required this.answer});

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;
  void setIsDone() => this.isDone = true;
  bool fieldCompleteCorrect() {
    bool complete =
        this.puzzles.where((puzzle) => puzzle.correctValue == null).length == 0;

    if (!complete) {
      // daha tamamlanmamıs
      this.isFull = false;
      return complete;
    }
    this.isFull = true;
    //tamamlandıysa, doğru olup olmadığını kontrol

    String answeredStirng =
        this.puzzles.map((puzzle) => puzzle.currentValue).join("");

    //aynı dize ise, cevap doğrudur
    return answeredStirng == this.answer;
  }

  WordFindQues clone() {
    return new WordFindQues(question: this.question, answer: this.answer);
  }
}

class WordFindChar {
  String? currentValue;
  int? currentIndex;
  String? correctValue;
  late bool hintShow;

  WordFindChar(
      {this.hintShow = false,
      this.correctValue,
      this.currentIndex,
      this.currentValue});
  getCurrentValue() {
    if (this.correctValue != null)
      return this.currentValue;
    else if (this.hintShow == true) return this.correctValue;
  }

  void clearValue() {
    this.currentIndex = null;
    this.currentValue == null;
  }
}
