import 'package:flutter/material.dart';

List<String> lst = ["Notifications", "Devices", "Passwords", "Language"];
List<Icon> icn = [
  Icon(Icons.notifications),
  Icon(Icons.important_devices),
  Icon(Icons.lock_outline),
  Icon(Icons.language),
];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  Animation avatarSize,delayedAnim;
  AnimationController controller;
  @override
  void initState() {
    super.initState();    
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);       
    avatarSize = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    delayedAnim = new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.100,
          0.300,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                  height: size.height * 0.345,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/profile2.jpg')),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Center(
                          //top: size.height * 0.345 /2.8,
                          //left: size.width/2.5,
                          child: FadeTransition(
                            opacity: avatarSize,
                                child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.jpg')),
                          )),
                      FadeTransition(
                        opacity: delayedAnim,
                                              child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                                'Bahadır Yıldız',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white                                        
                                ),
                              ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  )),
              _settings1(size),
            ],
          ),
          SizedBox(height: size.height * 0.171), //140
          Container(
            // height: size.height / 3.0,
            width: size.width - 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5.5,
                    blurRadius: 5.5,
                  )
                ]),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(6.0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lst[index]),
                  leading: icn[index],
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _settings1(Size size) {
    return Positioned(
      bottom: -size.height * 0.147, //-120,
      child: Container(
        //height: size.height / 5.0,
        width: size.width - 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child: Column(
          children: <Widget>[
            Container(
                child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  //dense: true,
                  title: Text('My Adress', style: TextStyle()),
                  leading: Icon(Icons.location_on),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  //dense: true,
                  title: Text(
                    'Account',
                    style: TextStyle(),
                  ),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
