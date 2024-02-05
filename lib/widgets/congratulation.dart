import 'package:quizapp/models/questions.dart';
import 'package:quizapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CongratsWidget extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  const CongratsWidget({super.key, required this.score, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/cap.jpg',
          width: 200,
          height: 200,
        ),
        const Text('CONGRATULATIONS ! ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 8,
        ),
        Text(
          'You Scored :$score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.red,

          ),
        ),
        const SizedBox(
          height: 17,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.black.withOpacity(0.3),
          ),
          child: TextButton(
            onPressed: onTap,
            child: const Text(
              'Redo Quiz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.pink
              ),
            ),
          ),
        )
      ],
    );
  }
}