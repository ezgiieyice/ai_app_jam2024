import 'package:flutter/material.dart';

PreferredSizeWidget buildCustomAppBar(String title, BuildContext context, Widget pushPage) {
  double screenHeight = MediaQuery.of(context).size.height;
  return PreferredSize(
    preferredSize: Size.fromHeight(screenHeight * 0.07), // Ekranın %10'u kadar yükseklik
    child: AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new, // Kendi ikonu burada kullanın
          color: Colors.white, // İkon rengini beyaz yap
          size: 40, // İkon boyutunu ayarlayın
        ),
        onPressed: () {
          // Geri butonuna basıldığında yapılacak işlem
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => pushPage),
          );
        },
      ),
    ),
  );
}
