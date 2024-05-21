import 'package:ai_app_jam2024/screen/detail.dart';
import 'package:ai_app_jam2024/screen/wordsList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Home> {
  String word = "kelime: "; // Başlangıçta gösterilecek metin
  String meaing = "anlamı: ";

  // Odak düğmesi tanımlama
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background1.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45),
                      BlendMode.darken,
                    ),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(16.0, 200, 16.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Eski Türkçe\'nin zengin dünyasında bir yolculuğa çıkın ve her gün yeni bir kelimeyle dilimizin köklerine dokunun.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      /*onTap: () async{
                        // Klavyeyi aç ve kelime arama yerine odaklan
                        _searchFocusNode.requestFocus();
                      },*/
                      onTap: () {
                        // Geri butonuna basıldığında yapılacak işlem
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DictionaryScreen()),
                        );
                      },
                      child: Container(
                        width: 143,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromRGBO(95, 158, 160, 1),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'keşfet',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width , // Genişliği sabit hale getirelim
                padding: EdgeInsets.fromLTRB(20.0, 32, 20.0, 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color.fromRGBO(30, 30, 30, 1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _capitalize(word),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        _capitalize(meaing),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 4),
                      const Text(
                        "\"**************\"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Diğer widget'ları buraya ekleyin
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Arama',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        focusNode: _searchFocusNode, // Odak düğmesini belirt
                        onChanged: (value) async {
                          // Metin alanı güncellendiğinde arama yap
                          setState(() {
                            // Arama sonucunu güncelle
                            word = value; // Aranan kelimeyi güncelle
                            searchWord(value).then((result) {
                              setState(() {
                                meaing = result ?? "Aradığınız kelime bulunamadı";

                              });
                            });
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Kelime ara ...',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          prefixIcon: Icon(Icons.search, color: Color.fromRGBO(30, 30, 30, 1)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> searchWord(String word) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('dictionary')
          .where('word', isEqualTo: word.toLowerCase())
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.get('meaning');
      } else {
        return null;
      }
    } catch (e) {
      print('Error searching for word: $e');
      return null;
    }
  }

  // Baş harfi büyük yapma fonksiyonu
  String _capitalize(String? s) {
    if (s == null || s.isEmpty) {
      return "";
    }
    return s.substring(0, 1).toUpperCase() + s.substring(1);
  }
}
