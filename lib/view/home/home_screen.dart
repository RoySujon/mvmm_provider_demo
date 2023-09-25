import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //argument pass from Navigator.PushNamed=====>
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['value']['id'].toString()),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Container(
                height: 10,
              ),
            )

            // Text(data);
          ],
        ),
      ),
    );
  }
}
