import 'package:ecommerceapp/Auth/signup.dart';
import 'package:ecommerceapp/Helper/pagetransitions.dart';
import 'package:ecommerceapp/homescreen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {

  bool _obscureText = true;
  String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Log into\n your account',
                      style:
                          TextStyle(fontFamily: 'PoppinsBold', fontSize: 22.0),
                    )),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                        ),
                        //SizedBox(height: 20.0),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_open),
                              suffixIcon: _obscureText
                                  ? IconButton(
                                      icon: Icon(Icons.enhanced_encryption),
                                      onPressed: _toggle)
                                  : IconButton(
                                      icon: Icon(Icons.no_encryption),
                                      onPressed: _toggle)),
                          obscureText: _obscureText,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  height: 55.0,
                  minWidth: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'PoppinsMedium'),
                    ),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      Navigator.push(context, ScaleRoute(page:HomeScreen() ));
                    },
                    color: Colors.blueGrey[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
                SizedBox(height: 15.0,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                  },
                  child: Text("Don't have an account ? Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
