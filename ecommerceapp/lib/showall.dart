import 'package:flutter/material.dart';

class ShowAll extends StatefulWidget {
  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizewidth = size.width;
    double sizeheight = size.height;
    return Scaffold(
      //backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        elevation: 0.0,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 2.0, bottom: 16.0, top: 16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Women's Tops",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PoppinsBold',
                          fontSize: 19.0)),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    iconSize: 26.0,
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.71,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.circular(5.0),
                        splashColor: Colors.blueGrey,
                                              child: Card(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    cardImage[index],
                                    height: 190.0,
                                  ),
                                ),
                                Positioned(
                                    top: 8.0,
                                    right: 8.0,
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white, // button color
                                        child: InkWell(
                                          splashColor:
                                              Colors.red, // inkwell color
                                          child: SizedBox(
                                              width: 36,
                                              height: 36,
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 18.0,
                                              )),
                                          onTap: () {},
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    bottom: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            cardTitle[index],
                                            style: TextStyle(
                                                fontFamily: 'PoppinsMedium'),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            '\$${cardPrice[index]}',
                                            style: TextStyle(
                                                fontFamily: 'PoppinsRegular',color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            )),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> cardImage = [
  "assets/images/girl1.png",
  "assets/images/girl2.png",
  "assets/images/girl3.png",
  "assets/images/girl4.png",
  "assets/images/girl5.png",
  "assets/images/girl6.png",
  "assets/images/girl8.png",
  "assets/images/girl9.png",
];

List<String> cardTitle = [
  "Basic Sweater",
  "Summer T-Shirt",
  "Basic Skirt",
  "Blouse",
  "Denim Short",
  "Stylish Jacket",
  "Faux Leather ",
  "Sweater",
];

List<String> cardPrice = [
  "30.25",
  "44.00",
  "40.00",
  "20.00",
  "50.25",
  "24.60",
  "60.00",
  "41.50",
];
