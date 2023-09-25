import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //argument pass from Navigator.PushNamed=====>
    // final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        title: const Text(

            // args == null ? 'Login sucesss' : args['message'].toString()
            'Home Screen'),
      ),
      body: const Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50),
            SizedBox(height: 20),
            Text('Sucessfull'

                // args == null ? '' : 'User ID :${args['value']['id']}'

                )

            // Text(data);
          ],
        ),
      ),
    );
  }
}
