import 'package:flutter/material.dart';

import '../screen/login.dart';

class ThirdSplash extends StatelessWidget {
  final VoidCallback? nextPage;
  const ThirdSplash({Key? key, this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          // Perde
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          // Logo
          Positioned(
            top: height * 0.25 - width * 0.1, // Ekranın üst yarısının %50'si - logo genişliğinin yarısı
            left: width * 0.5 - width * 0.2, // Ekranın genişliğinin yarısı - yarım logo genişliği
            child: Container(
              width: width * 0.45,
              child: Image.asset(
                'assets/logo.png',
                color: Colors.white,
              ),
            ),
          ),
          // Text
          Positioned(
            top: height * 0.5,
            left: width * 0.05,
            child: Container(
              width: width * 0.9,
              child: Text(
                '"Gelecek nesillere bir miras bırakacaksanız, dilinizi koruyun; çünkü dil, bir milletin hafızasıdır."',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Atatürk Yazısı
          Positioned(
            bottom: height * 0.28,
            right: width * 0.05,
            child: Text(
              'M. Kemal Atatürk',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(255, 215, 0, 1),
                fontFamily: 'Inter',
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Buton
          Positioned(
            top: height * 0.85, // height oranını kullanarak pozisyonlama
            left: width * 0.25,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false, // Arka planın belirginliğini kapatır
                      transitionDuration: Duration(milliseconds: 300),
                      transitionsBuilder: (context, animation, _, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(3.0, 0.0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut, // Animasyonun daha yumuşak olması için ekleme
                          )),
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, _) {
                        return Login(); // Login sayfasına geçiş yapılır
                      },
                    ),
                  );// Next butonuna tıklandığında yapılacak işlemi buraya ekleyin

                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: width * 0.5, // width oranını kullanarak genişlik
                  height: height * 0.05, // height oranını kullanarak yükseklik
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color.fromRGBO(255, 215, 0, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Keşfetmeye Başla',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: width * 0.05, // width oranını kullanarak font boyutu
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
