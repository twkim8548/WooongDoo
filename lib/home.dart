import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 127,
        leading: Transform.scale(
          scale: 1,
            child: IconButton(
              icon: Image.asset('assets/ic-home-logo.png'),
              onPressed: null,
            ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.settings_outlined),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
