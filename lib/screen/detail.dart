import 'package:ai_app_jam2024/screen/createsentence.dart';
import 'package:ai_app_jam2024/screen/home.dart';
import 'package:flutter/material.dart';

import '../navigation_bar/appbar.dart';

class Detail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Ekran yüksekliğini al
    final double screenHeight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width ;

    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      appBar: buildCustomAppBar('Kelime Detay', context, Home()),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildColumnWithTextField('Öğe 1'),
                _buildColumnWithTextField('Öğe 2'),
                _buildColumnWithTextField('Öğe 3'),
                _buildColumnWithTextField('Öğe 4'),
              ],
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
  Widget _buildColumnWithTextField(String title) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 2), // Sabit border genişliği eklendi
            ),
            width: double.infinity, // Genişlik ekran boyunca olacak şekilde ayarlandı
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16), // İçeriğin kenarlardan uzaklığı
              child: Text(
                'Metin', // Buradaki metinler, formda girilen metinlerle değiştirilebilir
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }



}

