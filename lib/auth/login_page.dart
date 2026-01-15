import 'package:flutter/material.dart';
import 'auth_service.dart';
import '../screens/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Student Login', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
              TextField(controller: password, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loading ? null : () async {
                  setState(() => loading = true);
                  try {
                    await auth.login(email.text, password.text);
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const DashboardPage()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                  setState(() => loading = false);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
