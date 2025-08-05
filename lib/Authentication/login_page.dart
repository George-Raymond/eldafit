import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo at the top
              Image.asset(
                'assets/logo.png', // Replace with your logo asset path
                height: 100,
              ),
              const SizedBox(height: 32.0),
              // Email field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              // Password field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              // Confirm Password field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              // Age confirmation checkbox
              Row(
                children: [
                  Checkbox(
                    value: false, // Replace with state management for actual use
                    onChanged: (value) {
                      // Add state management logic here
                    },
                  ),
                  const Text('I confirm I am 40 years or older'),
                ],
              ),
              const SizedBox(height: 24.0),
              // Sign-up button
              ElevatedButton(
                onPressed: () {
                  // Add Firebase sign-up logic here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16.0),
              // Google login button
              OutlinedButton.icon(
                onPressed: () {
                  // Add Firebase Google sign-in logic here
                },
                icon: Image.asset(
                  'assets/google_icon.png', // Replace with Google icon asset
                  height: 24,
                ),
                label: const Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // Facebook login button
              OutlinedButton.icon(
                onPressed: () {
                  // Add Firebase Facebook sign-in logic here
                },
                icon: Image.asset(
                  'assets/facebook_icon.png', // Replace with Facebook icon asset
                  height: 24,
                ),
                label: const Text('Continue with Facebook'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}