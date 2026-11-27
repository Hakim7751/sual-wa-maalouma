import 'package:flutter/material.dart';

void main() {
  runApp(const QuizGameApp());
}

class QuizGameApp extends StatelessWidget {
  const QuizGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سؤال ومعلومة',
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.indigo,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}

class Question {
  final String category;
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.category,
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

// بنك الأسئلة التجريبي (لكل مرحلة أسئلة بديلة لكي يتغير السؤال عند الخسارة)
final List<List<Question>> stagesBank = [
  // المرحلة 1
  [
    Question(
      category: 'معلومات دينية',
      text: 'ما هي أطول سورة في القرآن الكريم؟',
      options: ['سورة آل عمران', 'سورة البقرة', 'سورة النساء', 'سورة المائدة'],
      correctIndex: 1,
    ),
    Question(
      category: 'معلومات دينية',
      text: 'كم عدد أركان الإسلام؟',
      options: ['أربعة أركان', 'ستة أركان', 'خمسة أركان', 'سبعة أركان'],
      correctIndex: 2,
    ),
    Question(
      category: 'معلومات دينية',
      text: 'ما هو الشهر الذي أنزل فيه القرآن؟',
      options: ['شهر شعبان', 'شهر رجب', 'شهر محرم', 'شهر رمضان'],
      correctIndex: 3,
    ),
  ],
  // المرحلة 2
  [
    Question(
      category: 'معلومات ثقافية',
      text: 'ما هو أسرع حيوان بري في العالم؟',
      options: ['الفهد', 'الأسد', 'النمر', 'الغزال'],
      correctIndex: 0,
    ),
    Question(
      category: 'معلومات ثقافية',
      text: 'كم عدد قارات العالم؟',
      options: ['5 قارات', '6 قارات', '7 قارات', '8 قارات'],
      correctIndex: 2,
    ),
  ],
  // المرحلة 3
  [
    Question(
      category: 'معلومات تاريخية',
      text: 'في أي عام تم فتح مكة؟',
      options: ['6 هـ', '8 هـ', '10 هـ', '5 هـ'],
      correctIndex: 1,
    ),
    Question(
      category: 'معلومات تاريخية',
      text: 'من هو القائد المسلم الذي فتح الأندلس؟',
      options: ['خالد بن الوليد', 'صلاح الدين الأيوبي', 'طارق بن زياد', 'عمرو بن العاص'],
      correctIndex: 2,
    ),
  ],
];

int currentUnlockedStage = 0;
List<List<String>> stageHistory = List.generate(stagesBank.length, (_) => []);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
