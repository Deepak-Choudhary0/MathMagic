import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:math/pages/discussion.dart' as second;
import 'package:math/pages/game.dart' as third;
import 'package:math/pages/profile.dart' as fourth;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is 2+2/2*4?',
      'options': ['1', '0.5', '6', '2.25'],
      'answer': '6',
    },
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is the currency of Japan?',
      'options': ['Yen', 'Dollar', 'Euro', 'Pound'],
      'answer': 'Yen',
    },
    {
      'question': 'Who is the CEO of Tesla?',
      'options': ['Jeff Bezos', 'Elon Musk', 'Mark Zuckerberg', 'Bill Gates'],
      'answer': 'Elon Musk',
    },
  ];
  List<Color> _optionColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  bool _isAnswered = false;
  bool _isCorrect = false;

  void _checkAnswer(String answer) {
    setState(() {
      _isAnswered = true;
      _isCorrect = answer == _questions[_currentIndex]['answer'];

      for (int i = 0; i < _questions[_currentIndex]['options'].length; i++) {
        if (_questions[_currentIndex]['options'][i] == answer && _isCorrect) {
          _optionColors[i] = Colors.green;
        } else if (_questions[_currentIndex]['options'][i] == answer &&
            !_isCorrect) {
          _optionColors[i] = Colors.red;
        }
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _questions.length;
      _isAnswered = false;
      _optionColors = [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ];
    });
  }

  int _selectedIndex = 0;
  final List<GButton> _tabs = const [
    GButton(
      icon: Icons.home,
      text: "Home",
    ),
    GButton(
      icon: Icons.chat,
      text: "Ask Doubt",
    ),
    GButton(
      icon: Icons.games,
      text: "Games",
    ),
    GButton(
      icon: Icons.account_box_outlined,
      text: "Profile",
    ),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        if (index == 0) {
          // Navigate to the home page.
        } else if (index == 1) {
          // Navigate to the settings page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => second.DoubtPage()),
          );
        } else if (index == 2) {
          // Navigate to the settings page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => third.MathGamePage()),
          );
        } else if (index == 3) {
          // Navigate to the settings page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => fourth.ProfilePage()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Quiz App'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              _questions[_currentIndex]['question'],
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAnswered
                  ? null
                  : () {
                      _checkAnswer(_questions[_currentIndex]['options'][0]);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _optionColors[0],
                foregroundColor: Colors.black,
              ),
              child: Text(_questions[_currentIndex]['options'][0]),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAnswered
                  ? null
                  : () {
                      _checkAnswer(_questions[_currentIndex]['options'][1]);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _optionColors[1],
                foregroundColor: Colors.black,
              ),
              child: Text(_questions[_currentIndex]['options'][1]),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAnswered
                  ? null
                  : () {
                      _checkAnswer(_questions[_currentIndex]['options'][2]);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _optionColors[2],
                foregroundColor: Colors.black,
              ),
              child: Text(_questions[_currentIndex]['options'][2]),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAnswered
                  ? null
                  : () {
                      _checkAnswer(_questions[_currentIndex]['options'][3]);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _optionColors[3],
                foregroundColor: Colors.black,
              ),
              child: Text(_questions[_currentIndex]['options'][3]),
            ),
            const SizedBox(height: 16.0),
            _isAnswered
                ? Text(
                    _isCorrect
                        ? 'Correct!'
                        : 'Incorrect. The answer was ${_questions[_currentIndex]['answer']}.',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: _isCorrect ? Colors.green : Colors.red),
                  )
                : const SizedBox(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAnswered ? _nextQuestion : null,
              child: const Text('Next Question'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade700,
        gap: 8,
        padding: const EdgeInsets.all(16),
        tabs: _tabs,
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}
