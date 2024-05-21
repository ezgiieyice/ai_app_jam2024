import 'package:ai_app_jam2024/screen/detail.dart';
import 'package:flutter/material.dart';

import '../navigation_bar/appbar.dart';

class CreateSentence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar("Cümle Oluştur", context, Detail()),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CreateSentence()),
                );
              },
              child: Text('Alt Buton'),
            ),
          ),
        ],
      ),
    );
  }
}