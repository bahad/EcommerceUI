import 'package:ecommerceapp/Helper/circularButton.dart';
import 'package:ecommerceapp/Helper/colorSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductHome extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const ProductHome({Key key, this.title, this.price, this.image}) : super(key: key);

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  double rating = 4.0;
  final String desc =
      "Maxwell sole construction delivers exceptional durability and is resistant to oil,"
      "fat, acid, petrol and alkali; air-cushioned honeycomb";

  @override
  void initState() {
   // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizewidth = size.width;
    double sizeheight = size.height;
    var pricedouble = double.parse(widget.price) + double.parse(widget.price);
    ScreenUtil.instance =
        ScreenUtil(width: 411.428, height: 731.428, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f7),
        body: Stack(
          children: <Widget>[
             
            Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: Center(
                child: Hero(
                  tag: widget.title,
                                  child: Image.asset(widget.image,
                      width: double.infinity, height: sizeheight * 0.7),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFFdad9d5).withOpacity(0.3),
                        Color(0xFFdcd9d2),                                               
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.9],
                      tileMode: TileMode.clamp)),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  height: ScreenUtil().setHeight(300.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().setWidth(230.0),
                            ),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(25.0),
                                  fontFamily: 'PoppinsBold',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              CustomPaint(
                                  painter: LinePainter(),
                                  child: Text(
                                    '\$${pricedouble.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      fontSize: ScreenUtil().setSp(15.0),
                                      color: Colors.grey[700]
                                    ),
                                  )),
                              Text(
                                '\$${widget.price}',
                                style: TextStyle(
                                    fontFamily: 'MontserratBold',
                                    fontSize: ScreenUtil().setSp(17.0)),
                              )
                            ],
                          )
                        ],
                      ),
                      SmoothStarRating(
                        allowHalfRating: true,
                        onRatingChanged: (v) {
                          rating = v;
                          setState(() {});
                        },
                        starCount: 5,
                        rating: rating,
                        size: 22.0,
                        color: Colors.black,
                        borderColor: Colors.white,
                        spacing: 0.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Color',
                        style: TextStyle(
                            fontFamily: 'MontserratBold',
                            fontSize: ScreenUtil().setSp(20.0)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ColorSelector(
                            colors: 
                            [
                              Color(0xFF201e1f),
                              Color(0xFF919191),
                              Color(0xFFe3d4bf),
                            ],
                          ),
                          CircularButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(260),
                          ), 
                        child: Text(
                            desc,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontFamily: "PoppinsRegular",
                            ),
                          ), 
                          
                        ),
                        CircularButton(
                          color: Colors.black,
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          onPressed: () {},
                        ),
                        ],
                      )
                      
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;

    canvas.drawLine(
        Offset(0, size.height - 4), Offset(size.width, 4), linePaint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;
}
