import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        toolbarHeight: 80,
        title: const Text(
          'Registration',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement registration logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}