import 'package:flutter/material.dart';

import 'models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Question> questionList = getQuestion();
  int currentQuestion = 0;
  Answer? selectAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Simple Quiz App',style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(height: 10,),
            Text('Question ${currentQuestion+1}/${questionList.length}',style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(height: 40,),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${questionList[currentQuestion].questionText}',
                    style: TextStyle(color: Colors.black,fontSize: 15),
                  ),
                ),
                Positioned(
                  top: -26,
                  right: 0,
                  left: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.check,color: Colors.green,size: 30),
                  ),
                ),
                Positioned(
                  left: -20,
                  top: 10,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  right: -20,
                  top: 10,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                for(Answer answer in questionList[currentQuestion].answerList)
                  AnswerButton(answer)
              ],
            ),
            SizedBox(height: 30,),
            nextButton(),
          ],
        ),
      ),
    );
  }

  AnswerButton(Answer answer) {
    bool isSelected = answer == selectAnswer;
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
      child: MaterialButton(
        color: isSelected ? Colors.green : Colors.white,
        onPressed: () {
          setState(() {
            selectAnswer = answer;
          });
        },
        child: Text('${answer.answerText}'),
      ),
    );
  }

  nextButton() {
    bool isLastQues = false;
    if (currentQuestion == questionList.length - 1) {
      isLastQues = true;
    }
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadiusDirectional.circular(25)),
      child: MaterialButton(
        onPressed: () {
          if (selectAnswer!.isCorrect) {
            score++;
          }
          if (selectAnswer == null) {
          } else {
            if (isLastQues) {
              bool isPassed = false;
              if (score >= questionList.length * 0.5) {
                isPassed = true;
              }
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text(
                        "${isPassed ? 'Passed' : 'Failed'} | Score is $score",
                        style: TextStyle(
                            color: score >= questionList.length * 0.5
                                ? Colors.green
                                : Colors.red),
                      ),
                      content: SizedBox(
                        height: 60,
                        child: Center(
                          child: MaterialButton(
                              child: Text(
                                "Restart",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.black,
                              height: 50,
                              minWidth: 100,
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                  currentQuestion = 0;
                                  score = 0;
                                  selectAnswer = null;
                                });
                              }),
                        ),
                      ),
                    );
                  });
            } else {
              setState(() {
                selectAnswer = null;
                currentQuestion ++;
              });
            }
          }
        },
        child: Text(
          isLastQues ? 'Submit' : 'Next',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}

