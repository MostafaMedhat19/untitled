import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  String image ;
  String name;
  String price ;
  String description ;
  ProductDetailsScreen({super.key,
    required this.name ,
    required this.image ,
    required this.price,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
        child: Column(
          children: [
           FloatingActionButton(
                child:  Icon(Icons.home),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
                }),
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
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                ],
              ),
            ),
            const SizedBox(height: 5,),
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
                  child: Center(child: Text(price, style:  TextStyle(color: Colors.white, fontSize: 25 ),)),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            Center(
              child: Column(

                children: [
                  Text(description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
