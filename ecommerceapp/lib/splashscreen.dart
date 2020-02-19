import 'package:ecommerceapp/Auth/login.dart';
import 'package:ecommerceapp/Auth/signup.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _backgroundAnimation;
  AnimationController _scaleanimationController, _scaleanimationController2;
  Animation<double> _scaleAnimation1, _scaleAnimation2;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _scaleanimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _scaleanimationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _backgroundAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _scaleAnimation1 =
        Tween(begin: 0.2, end: 1.0).animate(_scaleanimationController);
    _scaleAnimation2 =
        Tween(begin: 0.2, end: 1.0).animate(_scaleanimationController);
    _animationController.forward();
    _scaleanimationController.forward().then((f) {
      Future.delayed(Duration(seconds: 1)).then((f) {
        _scaleanimationController2.forward();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleanimationController.dispose();
    _scaleanimationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizewidth = size.width;
    double sizeheight = size.height;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //IMAGE
        Image.asset(
          'assets/images/splash2.jpg',
          width: double.infinity,
          height: double.infinity,
          alignment: FractionalOffset(_backgroundAnimation.value, 0),
          fit: BoxFit.cover,
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FANCY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontFamily: 'MontserratBold'),
            ),
            SizedBox(height: 5.0),
            Text(
              'Best Fashion Shopping App',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'MontserratRegular'),
            ),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ScaleTransition(
                  scale: _scaleAnimation1,
                  child: ButtonTheme(
                    height: 55.0,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 6.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.lock_outline),
                          Text(
                            'Sign Up ',
                            style: TextStyle(
                                fontSize: 19.0, fontFamily: 'PoppinsMedium'),
                          ),
                          SizedBox()
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ScaleTransition(
                  scale: _scaleAnimation2,
                  child: ButtonTheme(
                    height: 55.0,
                    child: RaisedButton(
                      color: Colors.grey[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white,
                                fontFamily: 'PoppinsMedium'),
                          ),
                          SizedBox()
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
