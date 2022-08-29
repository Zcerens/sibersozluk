import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

class WordFind extends StatefulWidget {
  const WordFind({Key? key}) : super(key: key);

  @override
  State<WordFind> createState() => _WordFindState();
}

class _WordFindState extends State<WordFind> {
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();

  //make list question for puzzle
  //make class 1st

  late List<WordFindQues> listQuestions;

  @override
  void initState() {
    listQuestions = [
      WordFindQues(question: "What is name of this game?", answer: "Sozluk"),
      WordFindQues(question: "What is your name", answer: "Ceren"),
      WordFindQues(question: "bu ne", answer: "Oyun")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    color: Colors.blue,
                    //wordfind widget
                    // sent list our widget
                    child: WordFindWidget(constraints.biggest,
                        listQuestions.map((ques) => ques.clone()).toList(),
                        key: globalKey),
                  );
                },
              ),
            ),
            Container(
                child: TextButton(
              style: TextButton.styleFrom(
                side: BorderSide(
                    width: 15,
                    color: Colors.white,
                    strokeAlign: StrokeAlign.outside),
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                globalKey.currentState?.generatePuzzle(
                    loop: listQuestions.map((ques) => ques.clone()).toList());
              },
              child: Text("Yeniden Yükle"),
            )),
            SizedBox(
              height: 20,
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
  int indexQues = 0; //current index
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
                    color: Colors.lightGreen,
                    Icons.healing,
                    size: 45,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => generatePuzzle(left: true),
                      child: Icon(
                        color: Colors.lightGreen,
                        Icons.arrow_back_ios,
                        size: 45,
                      ),
                    ),
                    InkWell(
                      onTap: () => generatePuzzle(next: true),
                      child: Icon(
                        color: Colors.lightGreen,
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
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                "${currentQues.question ?? ''}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: currentQues.puzzles.map((puzzle) {
                  Color? color;
                  if (currentQues.isDone)
                    color = Colors.green[300];
                  else if (puzzle.hintShow)
                    color = Colors.yellow[100];
                  else if (currentQues.isFull)
                    color = Colors.red;
                  else
                    color = Color(0xff7EE7FD);

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
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: constraints.biggest.width / 7 - 6,
                      height: constraints.biggest.width / 7 - 6,
                      margin: EdgeInsets.all(5),
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
                  itemCount: 16, //later change
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool statusBtn = currentQues.puzzles.indexWhere(
                            (puzzle) => puzzle.currentIndex == index) >=
                        0;

                    return LayoutBuilder(builder: (context, constraints) {
                      Color color =
                          statusBtn ? Colors.white70 : Color(0xff7EE7FD);

                      return Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text(
                            "${currentQues.arrayBtns[index]}".toUpperCase(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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

    //check if got error generate random word
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
    // let dclare hint
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

      // check if complete

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      // my wrong..not refresh.. damn..haha
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
      // no complete yet
      this.isFull = false;
      return complete;
    }
    this.isFull = true;
    // if already complete check correct or not

    String answeredStirng =
        this.puzzles.map((puzzle) => puzzle.currentValue).join("");

    //if same string, answer is correct..yeay
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
