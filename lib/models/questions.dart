import 'package:flutter/material.dart';

class QuestionsWithAnswers {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;
  QuestionsWithAnswers({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final String text;
  final IconData icon;
  Answer({
    required this.text,
    required this.icon,
  });
}

List<QuestionsWithAnswers> questionsWithAnswers = [
  QuestionsWithAnswers(
    question: 'What programming language is often used for developing mobile apps in Android?',
    answers: [
      Answer(text: 'Java', icon: Icons.coffee),
      Answer(text: 'Python', icon: Icons.code),
      Answer(text: 'Swift', icon: Icons.abc),
      Answer(text: 'C#', icon: Icons.plus_one),
    ],
    correctAnswer: 'Java',
  ),
  QuestionsWithAnswers(
    question: 'Who is the co-founder of Microsoft Corporation?',
    answers: [
      Answer(text: 'Bill Gates', icon: Icons.person),
      Answer(text: 'Steve Jobs', icon: Icons.person),
      Answer(text: 'Mark Zuckerberg', icon: Icons.person),
      Answer(text: 'Elon Musk', icon: Icons.person),
    ],
    correctAnswer: 'Bill gates',
  ),
  QuestionsWithAnswers(
    question: 'Which programming language is often used for data analysis and machine learning?',
    answers: [
      Answer(text: 'Java', icon: Icons.coffee),
      Answer(text: 'Python', icon: Icons.code_off),
      Answer(text: 'C++', icon: Icons.plus_one),
      Answer(text: 'Ruby', icon: Icons.star),
    ],
    correctAnswer: 'Python',
  ),
];