import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:math/pages/quizscreen.dart' as first;
import 'package:math/pages/discussion.dart' as second;
import 'package:math/pages/profile.dart' as fourth;

class MathGamePage extends StatefulWidget {
  @override
  _MathGamePageState createState() => _MathGamePageState();
}

class _MathGamePageState extends State<MathGamePage> {
  final Random _random = Random();
  int _num1 = 0;
  int _num2 = 0;
  int _answer = 0;
  int _userAnswer = 0;
  int _score = 0;
  int _maxscore = 10;

  void _generateQuestion() {
    setState(() {
      _num1 = _random.nextInt(10) + 1;
      _num2 = _random.nextInt(10) + 1;
      _answer = _num1 + _num2;
      _userAnswer = 0;
    });
  }

  void _checkAnswer() {
    if (_userAnswer == _answer) {
      setState(() {
        _score++;
      });
    }
    _generateQuestion();
  }

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  int _selectedIndex = 2;
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => first.QuizPage()),
          );
        } else if (index == 1) {
          // Navigate to the settings page.
        } else if (index == 2) {
          // Navigate to the settings page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => second.DoubtPage()),
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
      appBar: AppBar(
        title: Text('Math Game'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Max. Score: $_maxscore',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Score: $_score',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '$_num1 + $_num2 = ?',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(36),
              child: TextField(
                scrollPadding: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 40,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: 'Enter your answer',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _userAnswer = int.tryParse(value) ?? 0;
                  });
                },
                onSubmitted: (_) => _checkAnswer(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Submit'),
            ),
          ),
        ],
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
