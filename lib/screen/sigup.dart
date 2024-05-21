import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  Future<void> _register(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('User registered: ${userCredential.user}');
      // Başarılı kayıt işleminden sonra giriş sayfasına yönlendirme yapılabilir
    } catch (e) {
      print('Error registering user: $e');
      // Hata durumunda kullanıcıya bildirim gösterilebilir veya işlem tekrar denenebilir
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // İlk Satır - %25
                  Container(
                    height: height * 0.25,
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png', // Asset path should be adjusted as per your asset name
                        width: width * 0.5,
                        height: height * 0.15,
                      ),
                    ),
                  ),
                  // İkinci Satır - %50
                  Container(
                    height: height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width * 0.85,
                          height: 63,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFF5F5DC)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _usernameController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Kullanıcı Adı',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.85,
                          height: 63,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFF5F5DC)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Mail Adresi',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.85,
                          height: 63,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFF5F5DC)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Şifre',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.85,
                          height: 63,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFF5F5DC)),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Şifre Tekrar',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.1,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Zaten hesabınız var mı?  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Giriş Yap sayfasına geçiş yap
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Giriş Yap',
                              style: TextStyle(
                                color: Color(0xFFFFD700),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Boşluk ve Dördüncü Satır - Kayıt Ol butonu
                  Container(
                    height: height * 0.1,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          // Kayıt Ol butonuna tıklama işlemi burada gerçekleştirilecek
                          _register(context);
                        },
                        child: Container(
                          width: 366,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFD700),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Kayıt Ol',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // İki kat boşluk ekler
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
