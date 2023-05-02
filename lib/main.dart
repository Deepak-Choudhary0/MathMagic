import 'package:flutter/material.dart';
import 'package:math/pages/onboared.dart' as first;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MathMagic(),
    ),
  );
}

class MathMagic extends StatefulWidget {
  _MathMagic createState() => _MathMagic();
}

class _MathMagic extends State<MathMagic> {
  @override
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                // 'https://source.unsplash.com/720x600/?math',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2UXOm64ZMBelxMHItj0AI3XPjf9Ee8TkVXKd0Sazo1Q&ec=48665701',
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Math App!',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Learn math in a fun and interactive way!',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            CheckboxListTile(
              title: Text('I agree to the terms and conditions of MathMagic'),
              value: _termsAndConditions,
              onChanged: (value) {
                setState(() {
                  _termsAndConditions = true;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const first.LoginPage()),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
