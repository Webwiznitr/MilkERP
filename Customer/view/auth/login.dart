import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _name;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isObsecure = true;
  bool isloading = false;
  bool userIsValid = false;

  _showsnack() {
    final snackbar = SnackBar(
      content: Text(
        'User not Found',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  login() async {
    setState(() {
      isloading = true;
      userIsValid = false;
    });
    if (_formKey.currentState.validate()) {
      try {
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: emailCont.text, password: passCont.text);
        User user = result.user;
        if (user != null) {
          setState(() {
            userIsValid = true;
          });
        } else {
          setState(() {
            userIsValid = false;
          });
        }

        print(user.email);
      } catch (e) {
        if (e is PlatformException) {
          if (e.code == 'ERROR_USER_NOT_FOUND') {
            _showsnack();
          }
        }
      }
      setState(() {
        isloading = false;
      });
      //
    }

    userIsValid
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserLanding(),
            ),
          )
        : null;

    //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  // logIn() async {
  //   final facebookLogin = FacebookLogin();
  //   final result = await facebookLogin.logIn(['email']);
  //   // final result = await facebookLogin.logInWithReadPermissions(['email']); --> Versions bellow 3.0
  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       print(result.accessToken.token);
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print('CANCELED BY USER');
  //       break;
  //     case FacebookLoginStatus.error:
  //       print(result.errorMessage);
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.getWhiteColor(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(18.0),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  loginScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  loginScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 70.0, top: 23.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Login ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              validator: (value) {
                return value.length > 8 && value.contains('@')
                    ? null
                    : 'Please Enter a valid Email';
              },
              onSaved: (_input) {
                setState(() {
                  _email = _input;
                });
              },
              controller: emailCont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              validator: (value) {
                return value.length > 8
                    ? null
                    : 'Enter a valid 8 Characters Password';
              },
              onSaved: (_input) {
                setState(() {
                  _password = _input;
                });
              },
              obscureText: isObsecure,
              controller: passCont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    child: Icon(
                        isObsecure ? Icons.visibility : Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                  ),
                  hintText: 'Password',
                  labelText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: MaterialButton(
              onPressed: login,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: isloading ? CupertinoActivityIndicator() : Text('Login'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13.0),
            child: FlatButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Registration(),
                ),
              ),
              child: Text('New User? Register'),
            ),
          ),
        ],
      ),
    );
  }
}
