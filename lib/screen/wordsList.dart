import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../navigation_bar/appbar.dart';
import 'home.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      appBar: buildCustomAppBar('Harfler', context, Home()),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('dictionary').orderBy('word').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Bir hata oluştu: ${snapshot.error}'),
            );
          }

          List<String> allWords = [];
          snapshot.data!.docs.forEach((document) {
            String word = document['word'].toString().toLowerCase();
            if (!allWords.contains(word[0])) {
              allWords.add(word[0]);
            }
          });

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: allWords.length,
                    itemBuilder: (context, index) {
                      String firstLetter = allWords[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WordListScreen(firstLetter: firstLetter),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(95, 158, 160, 1),
                            border: Border.all(color: Color(0xFFFFD700), width: 3.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                firstLetter.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 250.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WordListScreen extends StatelessWidget {
  final String firstLetter;

  const WordListScreen({required this.firstLetter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      appBar: buildCustomAppBar('$firstLetter ile başlayan kelimeler', context, DictionaryScreen()),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('dictionary')
            .where('word', isGreaterThanOrEqualTo: firstLetter)
            .where('word', isLessThan: firstLetter + 'z')
            .orderBy('word')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Bir hata oluştu: ${snapshot.error}'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              String word = document['word'].toString().toLowerCase();
              String meaning = document['meaning'].toString();
              return ListTile(
                title: Text(
                  word,
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.transparent,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(word, style: TextStyle(color: Colors.black)),
                        content: SingleChildScrollView(
                          child: Text(meaning, style: TextStyle(color: Colors.black)),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Kapat'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
