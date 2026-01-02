class Question {
  final String text;
  final List<String> options;         // For normal questions
  final String? correctAnswer;         // For normal questions (nullable)
  final String topic;                 // For normal questions

  // New fields for grid-format questions
  final List<String>? items;           // e.g., ['1.', '2.', '3.', ...]
  final List<String>? gridOptions;    // Flat list of all options (5 per row)
  final List<String>? correctAnswers; // List of correct letters (e.g., ['b', 'a', 'd'])
  final List<String>? topics;         // One topic per item (optional)
  final bool isGridFormat;

  Question({
    required this.text,
    this.options = const [],
    this.correctAnswer,
    this.topic = '',
    this.items,
    this.gridOptions,
    this.correctAnswers,
    this.topics,
    this.isGridFormat = false,
  });
}