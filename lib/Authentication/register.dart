import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _verificationId;
  bool _isLogin = true;
  bool _loading = false;

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleEmailAuth() async {
    setState(() => _loading = true);
    try {
      if (_isLogin) {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        _showSnack("Logged in with Email!");
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        _showSnack("Account Created!");
      }
    } catch (e) {
      _showSnack("Error: $e");
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _loading = true);
    try {
      final googleUser = await _googleSignIn.authenticate();
      // ignore: unnecessary_null_comparison
      if (googleUser == null) {
        _showSnack("Google Sign-In cancelled.");
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      _showSnack("Signed in with Google!");
    } catch (e) {
      _showSnack("Google sign-in failed: $e");
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _verifyPhone() async {
    setState(() => _loading = true);
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text.trim(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _showSnack("Phone auto-sign in successful!");
      },
      verificationFailed: (e) => _showSnack("Verification failed: $e"),
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _showOtpDialog();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
    setState(() => _loading = false);
  }

  void _showOtpDialog() {
    String otp = '';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Enter OTP"),
        content: PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) => otp = value,
          onCompleted: (code) => otp = code,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                final credential = PhoneAuthProvider.credential(
                  verificationId: _verificationId!,
                  smsCode: otp,
                );
                await _auth.signInWithCredential(credential);
                _showSnack("Phone login successful!");
                Navigator.of(context).pop();
              } catch (e) {
                _showSnack("OTP verification failed: $e");
              }
            },
            child: const Text("Verify"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Welcome to EldaFit",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isLogin ? "Login to continue" : "Register a new account",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email),
                    label: Text(
                      _isLogin ? "Sign in with Email" : "Register with Email",
                    ),
                    onPressed: _loading ? null : _handleEmailAuth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size.fromHeight(45),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() => _isLogin = !_isLogin),
                    child: Text(
                      _isLogin
                          ? "Don't have an account? Register"
                          : "Already have an account? Login",
                    ),
                  ),
                  const Divider(height: 30),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone (+255...)",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.sms),
                    label: const Text("Send OTP"),
                    onPressed: _loading ? null : _verifyPhone,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size.fromHeight(45),
                    ),
                  ),
                  const Divider(height: 30),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.g_mobiledata),
                    label: const Text("Sign in with Google"),
                    onPressed: _loading ? null : _signInWithGoogle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      minimumSize: const Size.fromHeight(45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
