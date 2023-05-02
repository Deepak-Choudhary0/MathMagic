import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:math/pages/quizscreen.dart' as first;
import 'package:math/pages/discussion.dart' as second;
import 'package:math/pages/game.dart' as third;

final String apiKey = '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';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;
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
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                ),
                SizedBox(height: 16),
                Text(
                  'Jokhyam Lamnio',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Unemployed Civil Engineer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('jokhyamlamnio@gmail.com'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  subtitle: Text('6909657166'),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Location'),
                  subtitle: Text('Arunachal Pradesh,India'),
                ),
                ListTile(
                  leading: Icon(Icons.work),
                  title: Text('Class'),
                  subtitle: Text('2nd Year'),
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text('Skills'),
                  subtitle: Text('Surveying , Measurement'),
                ),
              ],
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
