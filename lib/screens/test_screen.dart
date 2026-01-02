import 'dart:async';
import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/questions.dart';
import '../../models/question.dart';

class TestScreen extends StatefulWidget {
  final String name;
  final String email;

  const TestScreen({super.key, required this.name, required this.email});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // Keys: normal questions → "$qIndex"   |   grid questions → "$qIndex-$itemIndex"
  Map<String, String> selectedAnswers = {};
  bool isSubmitting = false;

  // Timer
  int _remainingSeconds = 45 * 60; // 45 minutes
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
          submitTest(); // Auto-submit
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  Future<String> getAiAnalysis(Map<String, String> answers) async {
    String wrongAnswers = '';
    int correctCount = 0;
    int totalQuestions = 0;

    for (int i = 0; i < questions.length; i++) {
      Question q = questions[i];

      if (q.isGridFormat) {
        // Grid format - null safety
        if (q.correctAnswers == null || q.items == null) continue;

        totalQuestions += q.correctAnswers!.length;
        for (int sub = 0; sub < q.correctAnswers!.length; sub++) {
          String key = '$i-$sub';
          String chosen = (answers[key] ?? 'Unanswered').toLowerCase();
          String correct = q.correctAnswers![sub].toLowerCase();

          if (chosen == correct) {
            correctCount++;
          } else {
            String topic = (q.topics != null && sub < q.topics!.length)
                ? q.topics![sub]
                : 'General';
            wrongAnswers +=
                'Q${i + 1} Item ${sub + 1}: Chose $chosen, Correct: $correct (Topic: $topic)\n';
          }
        }
      } else {
        // Normal single question
        totalQuestions++;
        String chosen = (answers[i.toString()] ?? 'Unanswered').toLowerCase();
        String correct = (q.correctAnswer ?? '?').toLowerCase();

        if (chosen == correct) {
          correctCount++;
        } else {
          wrongAnswers +=
              'Q${i + 1}: "${q.text}" Chose $chosen, Correct: $correct (Topic: ${q.topic})\n';
        }
      }
    }

    double percentage = totalQuestions > 0 ? (correctCount / totalQuestions) * 100 : 0;

    String prompt = '''
You are an expert English teacher assessing a placement test.

Score: $correctCount out of $totalQuestions (~${percentage.toStringAsFixed(0)}%)
Wrong/missed items:
$wrongAnswers

Provide:
1. Overall English level (CEFR: A1, A2, B1, B2, C1, or C2)
2. 3–5 specific weak topics the student should study
3. One short encouragement

Keep it concise and structured.
''';

    try {
      final response = await http.post(
        Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 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', // ← Replace with your real key
        },
        body: jsonEncode({
          'model': 'llama-3.3-70b-versatile',
          'messages': [{'role': 'user', 'content': prompt}],
          'temperature': 0.7,
          'max_tokens': 400,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'] ?? 'No analysis generated.';
      } else {
        print('Groq API Error: ${response.statusCode} - ${response.body}');
        return 'AI analysis unavailable. Fallback level: ${percentage >= 80 ? 'C1-C2' : percentage >= 60 ? 'B2' : percentage >= 40 ? 'B1' : percentage >= 20 ? 'A2' : 'A1'}.';
      }
    } catch (e) {
      print('Groq Exception: $e');
      return 'AI error. Fallback level based on score.';
    }
  }

  Future<void> sendResults(String name, String email, Map<String, String> answers, String aiAnalysis) async {
    String answersString = 'Answers:\n';
    for (int i = 0; i < questions.length; i++) {
      Question q = questions[i];
      if (q.isGridFormat) {
        if (q.items == null) continue;
        for (int sub = 0; sub < q.items!.length; sub++) {
          String key = '$i-$sub';
          answersString += 'Q${i + 1} Item ${sub + 1}: ${answers[key] ?? 'Unanswered'}\n';
        }
      } else {
        answersString += 'Q${i + 1}: ${answers[i.toString()] ?? 'Unanswered'}\n';
      }
    }

    try {
      await emailjs.send(
        'service_lv0bw6q',
        'template_7qurgd1',
        {
          'name': name,
          'student_email': email,
          'answers': answersString,
          'ai_analysis': aiAnalysis,
        },
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Test submitted successfully!')),
        );
      }
    } catch (e) {
      print('EmailJS Error: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Submission failed: $e')),
        );
      }
    }
  }

  void submitTest() async {
    if (isSubmitting) return;
    setState(() => isSubmitting = true);
    _timer?.cancel();

    String aiAnalysis = await getAiAnalysis(selectedAnswers);
    await sendResults(widget.name, widget.email, selectedAnswers, aiAnalysis);

    setState(() => isSubmitting = false);
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Level Test'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                _formatTime(_remainingSeconds),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: questions.length,
        itemBuilder: (context, qIndex) {
          Question q = questions[qIndex];

          if (q.isGridFormat) {
            // === GRID FORMAT QUESTION ===
            if (q.items == null || q.gridOptions == null || q.correctAnswers == null) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Error: Grid question data incomplete.', style: TextStyle(color: Colors.red)),
                ),
              );
            }

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${qIndex + 1}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(q.text, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    ...List.generate(q.items!.length, (itemIndex) {
                      String groupKey = '$qIndex-$itemIndex';
                      String currentValue = selectedAnswers[groupKey] ?? '';

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 40,
                              child: Text(
                                q.items![itemIndex],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                spacing: 12,
                                runSpacing: 8,
                                children: List.generate(5, (optIdx) {
                                  String value = String.fromCharCode(97 + optIdx); // a,b,c,d,e
                                  int optionIndex = itemIndex * 5 + optIdx;
                                  String label = optionIndex < q.gridOptions!.length
                                      ? q.gridOptions![optionIndex]
                                      : 'Missing option';

                                  return IntrinsicWidth(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio<String>(
                                          value: value,
                                          groupValue: currentValue,
                                          onChanged: (val) {
                                            setState(() {
                                              selectedAnswers[groupKey] = val!;
                                            });
                                          },
                                        ),
                                        Flexible(child: Text(label)),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          } else {
            // === ORIGINAL SINGLE-QUESTION FORMAT ===
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${qIndex + 1}: ${q.text}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...q.options.map((opt) {
                      String value = opt.trim().split(':').first.trim().toLowerCase();
                      return RadioListTile<String>(
                        title: Text(opt),
                        value: value,
                        groupValue: selectedAnswers[qIndex.toString()],
                        onChanged: (val) {
                          setState(() {
                            selectedAnswers[qIndex.toString()] = val!;
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: isSubmitting
          ? const CircularProgressIndicator()
          : FloatingActionButton.extended(
              onPressed: submitTest,
              label: const Text('Submit Test'),
              icon: const Icon(Icons.send),
            ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:emailjs/emailjs.dart' as emailjs;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../data/questions.dart';
// import '../../models/question.dart';

// class TestScreen extends StatefulWidget {
//   final String name;
//   final String email;

//   const TestScreen({super.key, required this.name, required this.email});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   Map<int, String> selectedAnswers = {};
//   bool isSubmitting = false;

//   // Timer variables
//   int _remainingSeconds = 45 * 60;  // 45 minutes
//   Timer? _timer;
//   bool _timerRunning = false;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timerRunning = true;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds--;
//         } else {
//           _timer?.cancel();
//           _timerRunning = false;
//           submitTest();  // Auto-submit when time ends
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

// Future<String> getAiAnalysis(Map<int, String> answers) async {
//   String wrongAnswers = '';
//   int correctCount = 0;

//   for (int i = 0; i < questions.length; i++) {
//     String chosen = answers[i] ?? 'Unanswered';
//     if (chosen == questions[i].correctAnswer) {
//       correctCount++;
//     } else {
//       wrongAnswers +=
//           'Q${i + 1}: "${questions[i].text}" Chose $chosen, Correct: ${questions[i].correctAnswer} (Topic: ${questions[i].topic})\n';
//     }
//   }

//   int score = correctCount;
//   String prompt =
//       'Based on this English test score ($score/${questions.length}) and wrong answers:\n$wrongAnswers\n'
//       'Assess the student\'s English level (e.g., Beginner A1, Elementary A2, Intermediate B1, Upper-Intermediate B2, Advanced C1, Proficient C2) '
//       'and suggest 3-5 specific topics or grammar/vocabulary areas to focus on for improvement. '
//       'Keep the response short and clear.';

//   try {
//     final response = await http.post(
//       Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer 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',  // ← Replace with your key
//       },
//       body: jsonEncode({
//         'model': 'llama-3.3-70b-versatile',  // Best free model (very capable)
//         // Other good options: 'llama-3.1-8b-instant' (faster), 'mixtral-8x7b-32768'
//         'messages': [
//           {'role': 'user', 'content': prompt},
//         ],
//         'temperature': 0.7,
//         'max_tokens': 300,
//       }),
//     );

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       return data['choices'][0]['message']['content'];
//     } else {
//       print('Groq API error: ${response.statusCode} - ${response.body}');
//       return _fallbackLevel(score);
//     }
//   } catch (e) {
//     print('Groq exception: $e');
//     return _fallbackLevel(score);
//   }
// }

// String _fallbackLevel(int score) {
//   double percentage = (score / questions.length) * 100;
//   if (percentage >= 80) return 'Advanced (C1-C2)';
//   if (percentage >= 60) return 'Upper-Intermediate (B2)';
//   if (percentage >= 40) return 'Intermediate (B1)';
//   if (percentage >= 20) return 'Elementary (A2)';
//   return 'Beginner (A1)';
// }

//   Future<void> sendResults(
//       String name, String email, Map<int, String> answers, String aiAnalysis) async {
//     // (Same as before, with updated emailjs v4 syntax)
//     String answersString = answers.entries
//         .map((e) => 'Q${e.key + 1}: Chosen ${e.value ?? 'Unanswered'}')
//         .join('\n');

//     try {
//       await emailjs.send(
//         'service_lv0bw6q',
//         'template_7qurgd1',
//         {
//           'name': name,
//           'student_email': email,
//           'answers': answersString,
//           'ai_analysis': aiAnalysis,
//         },
//       );

//       if (context.mounted) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text('Test submitted successfully!')));
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Submission failed: $e')));
//       }
//     }
//   }

//   void submitTest() async {
//     if (isSubmitting) return;
//     setState(() => isSubmitting = true);
//     _timer?.cancel();  // Stop timer on manual submit
//     String aiAnalysis = await getAiAnalysis(selectedAnswers);
//     await sendResults(widget.name, widget.email, selectedAnswers, aiAnalysis);
//     setState(() => isSubmitting = false);
//     if (context.mounted) {
//       Navigator.pop(context);
//     }
//   }

//   String _formatTime(int seconds) {
//     int min = seconds ~/ 60;
//     int sec = seconds % 60;
//     return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test in Progress'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Text(
//                 _formatTime(_remainingSeconds),
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//   itemCount: questions.length,
//   itemBuilder: (context, qIndex) {
//     Question q = questions[qIndex];

//     if (q.isGridFormat) {
//       // New grid format
//       return Card(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Q${qIndex + 1}: ${q.text}',
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               ...List.generate(q.items.length, (itemIndex) {
//                 int optionStart = itemIndex * 5;  // 5 options per row
//                 String currentGroup = selectedAnswers['$qIndex-$itemIndex'] ?? '';

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 30,
//                         child: Text(
//                           q.items[itemIndex],
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Expanded(
//                         child: Wrap(
//                           spacing: 16,  // Horizontal spacing
//                           runSpacing: 8, // If wraps to next line
//                           children: List.generate(5, (optIdx) {
//                             String optionValue = String.fromCharCode(97 + optIdx); // 'a', 'b', etc.
//                             String optionText = q.options[optionStart + optIdx];

//                             return Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Radio<String>(
//                                   value: optionValue,
//                                   groupValue: currentGroup,
//                                   onChanged: (val) {
//                                     setState(() {
//                                       selectedAnswers['$qIndex-$itemIndex'] = val!;
//                                     });
//                                   },
//                                 ),
//                                 Text(optionText),
//                               ],
//                             );
//                           }),
//                         ),
//                       ),
//                     ],
//                   );
//                 );
//               }),
//             ],
//           ),
//         ),
//       );
//     } else {
//       // Old single-question format (keep your existing code)
//       return Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Q${qIndex + 1}: ${q.text}'),
//               ...q.options.map((opt) => RadioListTile<String>(
//                     title: Text(opt),
//                     value: opt.split(': ')[0],
//                     groupValue: selectedAnswers[qIndex],
//                     onChanged: (val) {
//                       setState(() => selectedAnswers[qIndex] = val!);
//                     },
//                   )),
//             ],
//           ),
//         ),
//       );
//     }
//   },
// ),
//       floatingActionButton: isSubmitting
//           ? const CircularProgressIndicator()
//           : ElevatedButton(
//               onPressed: submitTest,
//               child: const Text('Submit'),
//             ),
//     );
//   }
// }
