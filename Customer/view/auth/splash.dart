import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.getWhiteColor(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: h / 6,
          ),
          Center(
            child: Container(
              height: h / 4,
              width: w / 2.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            height: h / 15,
          ),
          Text(
            'POOL BALL',
            style: GoogleFonts.poppins(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: h / 4,
          ),
          SizedBox(
            height: h / 16,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      )),
    );
  }
}
