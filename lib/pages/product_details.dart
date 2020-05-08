import 'package:ecommerce/ui/login.dart';
import 'package:ecommerce/utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_old_price;
  final product_detail_new_price;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_picture,
      this.product_detail_old_price,
      this.product_detail_new_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
          child: Text('Fashapp')),
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
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              AuthProvider().logOut();
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> new LoginPage()));
              
            },
          ),

//    Incase you want to keep the shopping cart icon on product details page as well
          // new IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},  /* inside curly braces ===> Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart())); */
          // )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

//            ================== the first buttons =====================

          Row(
            children: <Widget>[
//            ================== the size button ====================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close",style: TextStyle(color: Colors.red),),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),),
                    ],
                  ),
                ),
              ),

              //            ================== the colour button ====================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Colurs"),
                        content: new Text("Choose a colour"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close",style: TextStyle(color: Colors.red),),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Colour"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),),
                    ],
                  ),
                ),
              ),

              //            ================== the quantity button ====================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("close",style: TextStyle(color: Colors.red),),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty"),),
                      Expanded(child: new Icon(Icons.arrow_drop_down),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          //            ================== the second buttons =====================

          Row(
            children: <Widget>[
//            ================== the size button ====================
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),


              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed: (){}),

              new IconButton(icon: Icon(Icons.favorite_border), color: Colors.red, onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),
      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product name", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text(widget.product_detail_name),),
        ],
      ),

      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product brand", style: TextStyle(color: Colors.grey),),),

//       REMEMBER TO CREATE THE PRODUCT BRAND
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text("Brand X"),),
        ],
      ),

//    ADD THE PRODUCT  CONDITION
      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
          child: new Text("Product condition", style: TextStyle(color: Colors.grey),),),
          Padding(padding: EdgeInsets.all(5.0),
          child: new Text("New"),),
        ],
      ),

      Divider(),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Similar products"),
      ),


//          SIMILAR PRODUCTS SECTION
        Container(
          height: 300.0,
          child: SimilarProducts(),
        )
        ],
      ),
    );
  }
}


class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var product_list = [
    {
      "name": "Red heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 50,
      "price": 30,
    },

    {
      "name": "Floral skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 80,
      "price": 64,
    },
    {
      "name": "Pink skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 60,
      "price": 45,
    },
    
    {
      "name": "Burgandy Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 99,
      "price": 75,
    },
    {
      "name": "Black dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 100,
      "price": 30,
    },
    {
      "name": "Blazer for women",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 89,
      "price": 85,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                // here we are passing the values of the product to product details page
                  builder: (context) => new ProductDetails(
                    product_detail_name: prod_name,
                    product_detail_picture: prod_picture,
                    product_detail_old_price: prod_old_price,
                    product_detail_new_price: prod_price,
                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        ),
                        Text("\$${prod_price}", style: TextStyle(color: Colors.red),), 
                    ],),

//      Incase you like the grid view which is different than video 19 of the tutorial
                    // child: ListTile(
                    //   leading: Text(
                    //     prod_name,
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   title: Text("\$$prod_price",
                    //       style: TextStyle(
                    //           color: Colors.red, fontWeight: FontWeight.w800)),
                    //   subtitle: Text("\$$prod_old_price",
                    //       style: TextStyle(
                    //           color: Colors.black54,
                    //           fontWeight: FontWeight.w800,
                    //           decoration: TextDecoration.lineThrough)),
                    // ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}