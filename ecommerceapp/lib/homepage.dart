import 'package:ecommerceapp/Helper/selectedphoto.dart';
import 'package:ecommerceapp/Product/producthome.dart';
import 'package:ecommerceapp/showall.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController delayedAnimationsController;
  Animation animation;
  Animation delayedanim1,
      delayedanim2,
      dividerWidth,
      delayedanim3,
      delayedanim4,
      delayedanim5,
      cardsXTranslation,
      cardsScrollerOpacity,
      delayedanim6;

  int currentImage = 0;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    delayedAnimationsController = AnimationController(
        duration: Duration(milliseconds: 2200), vsync: this);
    animation = IntTween(begin: 0, end: images.length - 1).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: animationController))
      ..addListener(() {
        setState(() {
          currentImage = animation.value;
        });
      });
    animationController.repeat();
    delayedanim1 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.150,
          0.250,
          curve: Curves.easeIn,
        ),
      ),
    );
    dividerWidth = new Tween(begin: 0.0, end: 30.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.250,
          0.350,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    delayedanim2 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.350,
          0.450,
          curve: Curves.easeIn,
        ),
      ),
    );
    delayedanim3 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.450,
          0.550,
          curve: Curves.easeIn,
        ),
      ),
    );
    delayedanim4 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.550,
          0.650,
          curve: Curves.easeIn,
        ),
      ),
    );
    delayedanim5 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.600,
          0.700,
          curve: Curves.easeIn,
        ),
      ),
    );
    cardsXTranslation = new Tween(begin: 60.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.150,
          0.250,
          curve: Curves.ease,
        ),
      ),
    );
    cardsScrollerOpacity = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.150,
          0.250,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    delayedanim6 = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: delayedAnimationsController,
        curve: new Interval(
          0.700,
          0.800,
          curve: Curves.easeIn,
        ),
      ),
    );

    delayedAnimationsController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    delayedAnimationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizewidth = size.width;
    double sizeheight = size.height;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: false,
              pinned: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
              expandedHeight: 227.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(images[currentImage]),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Spring Collection',
                                style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(delayedanim1.value),
                                    fontFamily: 'MontserratLight',
                                    fontSize: 18.0),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                color: Colors.white.withOpacity(0.85),
                                width: dividerWidth.value,
                                height: 3.0,
                              ),
                              SizedBox(height: 3.0),
                              Text(
                                '20% OFF',
                                style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(delayedanim2.value),
                                    fontFamily: 'MontserratBold',
                                    fontSize: 40.0),
                              ),
                              SizedBox(height: 3.0),
                              Text(
                                'For Selected Spring Style',
                                style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(delayedanim3.value),
                                    fontFamily: 'MontserratLight',
                                    fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20.0,
                          left: 16.0,
                          right: 16.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SelectedPhoto(
                                  numberOfDots: images.length,
                                  photoIndex: currentImage),
                              RaisedButton(
                                elevation: 5.0,
                                color: Colors.grey[700],
                                child: Text(
                                  'Shop Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  //TITLE OF CARD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Designer Collection',
                          style: TextStyle(
                              color:
                                  Colors.black.withOpacity(delayedanim3.value),
                              fontFamily: 'PoppinsBold',
                              fontSize: 18.0)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAll()));
                        },
                        child: Text(
                          'Show All',
                          style: TextStyle(
                            color: Colors.grey.withOpacity(delayedanim3.value),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // DESIGNDER CARD
                  Container(
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(7.0)
                        ),
                    height: 253.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: cardImage.length,
                      itemBuilder: (context, index) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              cardsXTranslation.value, 0.0, 0.0),
                          child: Opacity(
                            opacity: cardsScrollerOpacity.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  borderRadius: BorderRadius.circular(7.0),
                                  highlightColor: Colors.blueGrey[50],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductHome(
                                                  title: cardTitle[index],
                                                  price: cardPrice[index],
                                                  image: cardImage[index],
                                                )));
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                        child: Hero(
                                            tag: cardTitle[index],
                                            child: Image.asset(cardImage[index],
                                                height: 190.0)),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5.0),
                                  child: Text(
                                    cardTitle[index],
                                    style:
                                        TextStyle(fontFamily: 'PoppinsMedium'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5.0),
                                  child: Text(
                                    '\$${cardPrice[index]}',
                                    style:
                                        TextStyle(fontFamily: 'PoppinsRegular'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  //TITLE OF TRENDS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Top Trends',
                          style: TextStyle(
                              color:
                                  Colors.black.withOpacity(delayedanim6.value),
                              fontFamily: 'PoppinsBold',
                              fontSize: 18.0)),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color:
                                  Colors.grey.withOpacity(delayedanim6.value)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(7.0)
                        ),
                    height: 253.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: trendsImage.length,
                      itemBuilder: (context, index) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              cardsXTranslation.value, 0.0, 0.0),
                          child: Opacity(
                            opacity: cardsScrollerOpacity.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    borderRadius: BorderRadius.circular(7.0),
                                    highlightColor: Colors.blueGrey[50],
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductHome(
                                                    image: trendsImage[index],
                                                    price: trendsPrice[index],
                                                    title: trendsTitle[index],
                                                  )));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Hero(
                                          tag: trendsImage[index],
                                          child: Image.asset(trendsImage[index],
                                              height: 190.0)),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5.0),
                                  child: Text(
                                    trendsTitle[index],
                                    style:
                                        TextStyle(fontFamily: 'PoppinsMedium'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5.0),
                                  child: Text(
                                    trendsPrice[index],
                                    style:
                                        TextStyle(fontFamily: 'PoppinsRegular'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> images = [
  "assets/images/homegirl2.jpg",
  "assets/images/homegirl3.jpg",
  "assets/images/homegirl1.jpg",
];

List<String> cardImage = [
  "assets/images/girl1.png",
  "assets/images/girl2.png",
  "assets/images/girl3.png",
  "assets/images/girl4.png",
];
List<String> cardTitle = [
  "Basic Sweater",
  "Summer T-Shirt",
  "Basic Skirt",
  "Blouse",
];
List<String> cardPrice = [
  "30.25",
  "44.00",
  "40.00",
  "20.00",
];
List<String> trendsImage = [
  "assets/images/girl5.png",
  "assets/images/girl6.png",
  "assets/images/girl8.png",
  "assets/images/girl9.png",
];
List<String> trendsTitle = [
  "Denim Short",
  "Stylish Jacket",
  "Faux Leather ",
  "Sweater",
];
List<String> trendsPrice = [
  "50.25",
  "24.60",
  "60.00",
  "41.50",
];
