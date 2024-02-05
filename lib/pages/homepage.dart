import 'package:quizapp/models/questions.dart';
import 'package:quizapp/utils/app_colors.dart';
import 'package:quizapp/widgets/answers.dart';
import 'package:quizapp/widgets/congratulation.dart';
import 'package:quizapp/widgets/button.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool check = false;
  int score = 0;
  int questionIndex = 0;
  bool isFinished = false;
  String? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: (!isFinished)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(questionsWithAnswers[questionIndex].question,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 8,
                ),
                const Text('Answer and Recieve Points',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Question ${questionIndex + 1} ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'of ${questionsWithAnswers.length}',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black.withOpacity(
                            0.4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: AppColors.black.withOpacity(
                      0.3), // Customize the color of the divider
                  thickness: 1,
                ),
                Column(
                  children: questionsWithAnswers[questionIndex]
                      .answers
                      .map(
                        (answer) => AnswerWidgetItem(
                      answer: answer,
                      selectedAnswer: selectedAnswer,
                      check: check,
                      questionIndex: questionIndex,
                      onTap: () {
                        setState(() {
                          selectedAnswer = answer.text;
                        });
                      },
                    ),
                  )
                      .toList(),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 129),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green .withOpacity(0.8),
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Click me for Answer !'),
                    ),
                  ),
                ),
                const Spacer(),
                MainButton(
                    text: 'Next',
                    onTap: () {
                      setState(() {
                        if (selectedAnswer == null) {
                          showMessage('You cant proceed without an answer');
                          return;
                        }
                        if (selectedAnswer ==
                            questionsWithAnswers[questionIndex]
                                .correctAnswer) {
                          score++;
                        }
                        if (questionIndex <
                            questionsWithAnswers.length - 1) {
                          questionIndex++;
                        } else {
                          isFinished = true;
                        }
                        selectedAnswer = null;
                        check = false;
                      });
                    })
              ],
            )
                : CongratsWidget(
                score: score,
                onTap: () {
                  setState(() {
                    score = 0;
                    questionIndex = 0;
                    isFinished = false;
                    check = false;
                  });
                }),
          ),
        ),
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 140, top: 140),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        content: SizedBox(
          width: 40,
          child: Text(
            message,
            softWrap: true,
          ),
        ),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

Widget answerButton({required String text, required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    ),
  );
}

void answerQuestion() {
  debugPrint('Hi');
}