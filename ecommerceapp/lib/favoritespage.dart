import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<String> imgs = [
  "assets/images/favorite1.jpg",
  "assets/images/favorite2.jpg",
  "assets/images/favorite3.jpg",
  "assets/images/favorite4.jpg",
];
List<String> product = [
  "Green Coat",
  "Basic T-Shirt",
  "Summer Red T-Shirt",
  "Black Trend 2020",
];
List<String> price = [
  "20 €",
  "20 €",
  "25 €",
  "50 €",
];

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
            color: Colors.white,
            height: size.height/2.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  actions: <Widget>[
                    IconSlideAction(
                        caption: 'Sepete Ekle',
                        color: Colors.blue,
                        icon: Icons.add_box,
                        onTap: () {}),
                    IconSlideAction(
                        caption: 'Paylaş',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () {}),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                        caption: 'Detay',
                        color: Colors.black45,
                        icon: Icons.more_horiz,
                        onTap: () {}),
                    IconSlideAction(
                        caption: 'Sil',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {}),
                  ],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                    leading: ConstrainedBox( 
                      constraints: BoxConstraints( 
                        minWidth: 84,
                        minHeight: 84,
                        maxWidth: 104,
                        maxHeight: 104,
                      ),
                      child: Image.asset(imgs[index],fit: BoxFit.fitWidth,),
                    ),
                    title: Text(product[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(price[index]),
                  ),
                  Divider()
                    ],
                  )
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Promo Code',style: TextStyle(color: Colors.grey)),
                  SizedBox(),
                  Row(
                    children: <Widget>[
                      Text('Spring Sale',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      SizedBox(width: 5.0),
                      Icon(Icons.adjust)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total Amount',style: TextStyle(color: Colors.grey)),
                  SizedBox(),
                  Text('210 €',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 46.0,
                            child: RaisedButton(
                  child: Text('Sepete Git',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                  onPressed: (){},
                  color: Colors.black,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
