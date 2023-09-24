import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Enter the right email';
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Enter the right Password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Utils.toastMessage('Error');
          Utils.flushbarErrorMessage(context, 'message');
        },
      ),
    );
  }
}
