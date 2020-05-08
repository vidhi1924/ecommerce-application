import 'package:flutter/material.dart';
import 'package:ecommerce/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer for men",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 50,
      "price": 30,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 60,
      "price": 20,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 90,
      "price": 85,
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
      "name": "Joggers",
      "picture": "images/products/pants2.jpeg",
      "old_price": 90,
      "price": 50,
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
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
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
