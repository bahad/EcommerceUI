import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  Animation animation,delayedAnim, delayedAnim2;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    delayedAnim = new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.100,
          0.500,
          curve: Curves.easeIn,
        ),
      );
      delayedAnim2 = new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.500,
          0.900,
          curve: Curves.easeIn,
        ),
      );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                top: size.height / 13.0,
                left: 16.0,
                right: 16.0,
                bottom: size.height / 21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Explore',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'MontserratMedium',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1)),
                SizedBox(height: 15.0),
                //SEARCH BAR
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      hintText: '  Search',
                      prefixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                FadeTransition(
                  opacity: animation,
                                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/explore2.jpg',
                            fit: BoxFit.cover,
                            height: 280.0,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 120.0,
                            left: size.width / 4.8,
                            child: Column(
                              children: <Widget>[
                                Text('New Stylish 2019',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width < 411 ? 22.0 : 24.0,
                                        fontWeight: FontWeight.bold)),
                                Text('Up to %20',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            size.width < 411 ? 18.0 : 20.0)),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 15.0),
                FadeTransition(
                  opacity: delayedAnim,
                                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/explore1.jpg',
                            fit: BoxFit.cover,
                            height: 280.0,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 120.0,
                            left: size.width / 4.8,
                            child: Text('Black Jackets',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width < 411 ? 22.0 : 24.0,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 15.0),
                FadeTransition(
                  opacity: delayedAnim2,
                                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/explore4.jpg',
                            fit: BoxFit.cover,
                            height: 280.0,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 120.0,
                            left: size.width / 4.8,
                            child: Column(
                              children: <Widget>[
                                Text('Summer Clothes',
                                    style: TextStyle(
                                        color: Colors.blueGrey[100],
                                        fontSize: size.width < 411 ? 22.0 : 24.0,
                                        fontWeight: FontWeight.bold)),
                                Text('Shorts, T-shirts',
                                    style: TextStyle(
                                        color: Colors.blueGrey[100],
                                        fontSize:
                                            size.width < 411 ? 18.0 : 20.0)),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
