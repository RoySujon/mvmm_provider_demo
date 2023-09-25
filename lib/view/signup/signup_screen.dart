import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/res/componets/round_button.dart';
import 'package:mvmm_provider_demo/utils/utils.dart';
import 'package:mvmm_provider_demo/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _emaailFocusNode = FocusNode();

  final _showPassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        // centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      focusNode: _emaailFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
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
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                          hintText: 'Email'),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: _showPassword,
                      builder: (context, value, child) => TextFormField(
                        // autofocus: true,
                        focusNode: _passwordFocusNode,
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   return 'Please Enter the right Password';
                          // } else if (value.length <= 6) {
                          //   return 'Please Enter 6 digit Password';
                          // }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: _showPassword.value,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (_showPassword.value == true) {
                                    _showPassword.value = false;
                                  } else {
                                    _showPassword.value = true;
                                  }
                                },
                                icon: Icon(_showPassword.value == true
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            border: const OutlineInputBorder(),
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Consumer<AuthViewModel>(
                builder: (context, value, child) => RoundButton(
                  loading: value.loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString()
                      };
                      value.signUpApi(
                          data, context, _emailController, _passwordController);
                    }
                  },
                  // loading: false,
                  title: 'Sign Up',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Alrady have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
