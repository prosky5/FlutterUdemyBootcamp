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
        backgroundColor: Colors.brown.shade500,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(url),
                radius: 70.0,
              ),
              Text('Stas ProSky',
                  style: TextStyle(
                      fontFamily: 'Mr Dafoe',
                      color: Colors.lime.shade100,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0)),
              Text('Android Developer'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey.shade100,
                      fontSize: 14.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25.0,
                width: 150.0,
                child: Divider(color: Colors.grey.shade100),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                child: Column(
                  children: [
                    Card(
                        color: Colors.lime.shade100,
                        child: ListTile(
                          leading:
                              Icon(Icons.call, color: Colors.brown.shade500),
                          title: Text('+7 960 238 64 04',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown.shade500)),
                        )),
                    Card(
                      color: Colors.lime.shade100,
                      child: ListTile(
                        leading: Icon(Icons.mail, color: Colors.brown.shade500),
                        title: Text('prosky25@gmail.com',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.brown.shade500)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
