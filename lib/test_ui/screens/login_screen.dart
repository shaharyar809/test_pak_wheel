import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to PakWheels'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.people,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Safely Connect with Buyers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You can connect with thousands of buyers and quick search',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone number',
                prefixText: '+92 ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to HomeScreen on successful login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Continue with Mobile Number'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            SignInButton(
              text: 'Continue with Google',
              icon: Icons.g_mobiledata,
              color: Colors.white,
              onPressed: () {
                // Implement Google Sign-In here
                print('Google Sign-In tapped');
              },
            ),
            SizedBox(height: 10),
            SignInButton(
              text: 'Continue with Facebook',
              icon: Icons.facebook,
              color: Colors.blue,
              onPressed: () {
                // Implement Facebook Sign-In here
                print('Facebook Sign-In tapped');
              },
            ),
            SizedBox(height: 10),
            SignInButton(
              text: 'Continue with Email',
              icon: Icons.email,
              color: Colors.grey.shade200,
              onPressed: () {
                // Implement Email Sign-In here
                print('Email Sign-In tapped');
              },
            ),
            SizedBox(height: 30),
            Text(
              'By continuing you agree to our Terms of use and Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SignInButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black),
      label: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
      ),
    );
  }
}