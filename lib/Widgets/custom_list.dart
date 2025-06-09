import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/product_provider.dart';

import '../Screens/product_details_screen.dart';

class CustomList extends StatelessWidget {
  int index ;
  String image ;
  String name;
  String price ;
  CustomList({super.key,
    required this.name ,
    required this.image ,
    required this.price,
    required this.index});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<ProductProvider>(context ,  listen:  false).model?.products;
    return GestureDetector(
      onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ProductDetailsScreen(
              name: obj?[index]['name'],
              image: obj?[index]['imageUrl'],
              description: obj?[index]['description'],
              price: obj![index]['price'].toString(),

            ),));
      },
      child: Card(
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Image.network(image, height:  500,width: 500,)
                  ],
                ),

              ),
              Center(
                child: Column(

                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    shadowColor: Colors.black12,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    color: Colors.green,
                    child: Center(child: Text(price, style:  TextStyle(color: Colors.white, fontSize: 15 ),)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
