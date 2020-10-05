import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
    @required this.sel0,
    @required this.sel1,
    @required this.sel2,
    @required this.sel3,
    @required this.sel4,
  }) : super(key: key);
  final bool sel0;
  final bool sel1;
  final bool sel2;
  final bool sel3;
  final bool sel4;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25.0, 15, 30, 0),
            title: Container(
              height: h / 15,
              width: w / 13,
              decoration: BoxDecoration(
                  gradient: sel0
                      ? LinearGradient(
                          colors: [AppColors.getOrange(), AppColors.getPink()])
                      : LinearGradient(colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ])),
              child: Center(
                child: Text(
                  'HOME',
                  style: GoogleFonts.roboto(
                      letterSpacing: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:
                          sel0 ? AppColors.getWhite() : AppColors.getBlack()),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              //Navigator.pushNamed(context, 'profile_screen');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0, 30, 0),
            title: Container(
              height: h / 15,
              width: w / 13,
              decoration: BoxDecoration(
                  gradient: sel1
                      ? LinearGradient(
                          colors: [AppColors.getOrange(), AppColors.getPink()])
                      : LinearGradient(colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ])),
              child: Center(
                child: Text(
                  'ABOUT US',
                  style: GoogleFonts.roboto(
                      letterSpacing: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:
                          sel1 ? AppColors.getWhite() : AppColors.getBlack()),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
              //Navigator.pushNamed(context, 'order_screen');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0, 30, 0),
            title: Container(
              height: h / 15,
              width: w / 13,
              decoration: BoxDecoration(
                  gradient: sel2
                      ? LinearGradient(
                          colors: [AppColors.getOrange(), AppColors.getPink()])
                      : LinearGradient(colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ])),
              child: Center(
                child: Text(
                  'SERVICES',
                  style: GoogleFonts.roboto(
                      letterSpacing: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:
                          sel2 ? AppColors.getWhite() : AppColors.getBlack()),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServicePage()));
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25.0, 8, 30, 0),
            title: Container(
              height: h / 15,
              width: w / 13,
              decoration: BoxDecoration(
                  gradient: sel3
                      ? LinearGradient(
                          colors: [AppColors.getOrange(), AppColors.getPink()])
                      : LinearGradient(colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ])),
              child: Center(
                child: Text(
                  'BLOGS',
                  style: GoogleFonts.roboto(
                      letterSpacing: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:
                          sel3 ? AppColors.getWhite() : AppColors.getBlack()),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BlogPage()));
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25.0, 8, 30, 0),
            title: Container(
              height: h / 15,
              width: w / 13,
              decoration: BoxDecoration(
                  gradient: sel4
                      ? LinearGradient(
                          colors: [AppColors.getOrange(), AppColors.getPink()])
                      : LinearGradient(colors: [
                          Colors.transparent,
                          Colors.transparent,
                        ])),
              child: Center(
                child: Text(
                  'SHOP',
                  style: GoogleFonts.roboto(
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: sel4 ? AppColors.getWhite() : AppColors.getBlack(),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ShopPage()));
            },
          ),
        ],
      ),
    );
  }
}
