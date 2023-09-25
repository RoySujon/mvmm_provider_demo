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

  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final _emaailFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _emaailFocusNode.nextFocus();
  }

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
                      autofocus: true,
                      focusNode: _emaailFocusNode,
                      validator: (value) {
                        if (value == '') {
                          return 'Enter the right email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusNode(
                            _emaailFocusNode, _passwordFocusNode, context);
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                          hintText: 'Email'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      // autofocus: true,
                      focusNode: _passwordFocusNode,
                      validator: (value) {
                        if (value == '') {
                          return 'Enter the right Password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: Icon(Icons.abc)),
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password)),
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
