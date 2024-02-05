import 'package:quizapp/models/questions.dart';
import 'package:quizapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AnswerWidgetItem extends StatelessWidget {
  final int questionIndex;
  final bool check;
  final Answer answer;
  final String? selectedAnswer;
  final VoidCallback onTap;
  const AnswerWidgetItem(
      {super.key,
        required this.answer,
        this.selectedAnswer,
        required this.onTap,
        required this.check,
        required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey.withOpacity(
                0.3,
              ),
            ),
            color: selectedAnswer == answer.text
                ? AppColors.green
                : (check &&
                answer.text ==
                    questionsWithAnswers[questionIndex].correctAnswer)
                ? AppColors.yellow
                : AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  answer.icon,
                  color: selectedAnswer == answer.text
                      ? AppColors.white
                      : AppColors.black,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  answer.text,
                  style: TextStyle(
                    color: selectedAnswer == answer.text
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}