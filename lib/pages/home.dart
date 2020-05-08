import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// my own imports
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/utils/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/c1.jpg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/w3.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/m2.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 10.0,
      dotBgColor: Colors.transparent,
      dotColor: Colors.white70,
    ),
  );  
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Fashapp'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
                accountName: Text('Vidhi Shah'),
                accountEmail: Text('vidhi19@somaiya.edu'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white,),
                  ), 
                ),
                decoration: new BoxDecoration(
                  color: Colors.red
                ),
                ),
//                body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red,),
            ),
          ),
          
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(Icons.person, color: Colors.red,),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red,),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
            },
            child: ListTile(
              title: Text('Shopping cart'),
              leading: Icon(Icons.shopping_cart, color: Colors.red,),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite, color: Colors.red,),
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){
              AuthProvider().logOut();
            },
            child: ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.exit_to_app),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, /*color: Colors.blue,*/),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, /*color: Colors.green,*/),
            ),
          ),

          ],
        ),
      ),
      // body: new ListView was changed to body: new Column 
      body: new Column(
        children: <Widget>[
          // image carousel begins here
          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),),

          // horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Recent Products'),),

          //grid view
          // Container(
          //   // height: 250.0,   /*removed with ListView*/
          //   child: Products(),
          // )
          Flexible(child: Products()),
        ],
      ),
    );
  }
}
