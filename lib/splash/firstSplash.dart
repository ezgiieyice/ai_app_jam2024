import 'package:ai_app_jam2024/splash/secondSplash.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class FirstSplash extends StatelessWidget {
  final VoidCallback? nextPage;
  const FirstSplash({Key? key, this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ekran boyutlarını almak için MediaQuery kullanıyoruz
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(34, 34, 34, 0.6),
              ),
            ),
          ),
          Positioned(
            top: height * 0.46 - width * 0.1, // Eski Türkçe Sözlüğü yazısının üstüne gelmesi için
            left: width * 0.07,
            child: Container(
              width: width * 0.2, // Logo genişliği
              child: Image.asset(
                'assets/logo.png', // Logo resminin yolunu verin
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.68, // height oranını kullanarak pozisyonlama
            left: width * 0.07,
            child: Text(
              'Dilimizin Köklerine Yolculuk',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: width * 0.055, // width oranını kullanarak font boyutu
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: height * 0.85, // height oranını kullanarak pozisyonlama
            left: width * 0.32,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Göster butonuna tıklandığında yapılacak işlemi buraya ekleyin
                  nextPage?.call(); // nextPage callback'i çağrılarak bir sonraki sayfaya geçiş sağlanır
                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: width * 0.36, // width oranını kullanarak genişlik
                  height: height * 0.05, // height oranını kullanarak yükseklik
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(255, 215, 0, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Sonraki', // "Next" yerine "Göster" yazısı
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: width * 0.05, // width oranını kullanarak font boyutu
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: height * 0.54, // height oranını kullanarak pozisyonlama
            left: width * 0.07,
            child: Text(
              'Eski Türkçe\nSözlüğü',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: width * 0.11, // width oranını kullanarak font boyutu
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


