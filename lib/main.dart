import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String url = "https://lh3.googleusercontent.com/pw/"
        "ACtC-3ehGccLLNm3xpMPmsSKuPDfYl1qg0Yl8lP3qxdZY8ECKisw4LKI8igPme1G8ez3_"
        "0Gos17KyKZdd_Zy7zDtGRIvyS7AF03L6kzQejOtLpAU9wkS-"
        "ynmIGYmfNEbSWAmjE22KbDXxzRpf2sV8N0Je9Hv=w1405-h936-no?authuser=0";
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[400],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 70.0,
              ),
              Text(
                'Stas ProSky',
                style: TextStyle(
                    fontFamily: 'Mr Dafoe',
                    color: Colors.lime[100],
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0)
              ),
              Text(
                'Android Developer'.toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                    fontSize: 14.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold)
              )
            ],
          ),
        )),
      ),
    );
  }
}
