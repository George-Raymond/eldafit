import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Icon(Icons.fitness_center, size: 100, color: Colors.black),
              SizedBox(height: 20),
              Text(
                'Welcome to EldaFit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Your journey to a healthier you starts here.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Text('I confirm I am 40 years or older'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 20),
              Text('or'),
              SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_translate),
                label: Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook),
                label: Text('Continue with Facebook'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('English'),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    items: <String>['Kiswahili'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}