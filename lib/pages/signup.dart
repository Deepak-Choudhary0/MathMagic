import 'package:flutter/material.dart';
import 'package:math/pages/onboared.dart' as first;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _termsAndConditions = false;
  final List<String> _classOptions = [
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12'
  ];
  String _selectedClass = 'Class 6';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _confirmPassword,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                onChanged: (newValue) {
                  setState(() {
                    _selectedClass = newValue.toString();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Class',
                ),
                items: _classOptions
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a class';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text('I agree to the terms and conditions'),
                value: _termsAndConditions,
                onChanged: (value) {
                  setState(() {
                    _termsAndConditions = true;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              ),
              TextButton(
                child: const Text('Already have an account? Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const first.LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
