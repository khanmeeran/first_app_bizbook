import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/reusable_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'demo@bizbook.com');
  final _passwordController = TextEditingController(text: '123456');
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Sign in to continue managing your business.', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  BizBookTextField(
                    label: 'Email',
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
                  ),
                  const SizedBox(height: 16),
                  BizBookTextField(
                    label: 'Password',
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    validator: (value) => value == null || value.length < 4 ? 'Password must be at least 4 chars' : null,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(value: _rememberMe, onChanged: (value) => setState(() => _rememberMe = value ?? false)),
                      const Text('Remember me'),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BizBookButton(
                    label: 'Login',
                    icon: Icons.login,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, AppConstants.homeRoute);
                      }
                    },
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
