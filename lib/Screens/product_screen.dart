import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/product_provider.dart';
import '../Widgets/custom_list.dart';
import 'category_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Call productData only once, safely


    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.home),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
          }),
      appBar: AppBar(title: Text("Products")),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          var data = value.model?.products;

          if (data == null) {
            value.productData();
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 60,
              mainAxisSpacing: 50,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CustomList(
                index: index,
                name: data[index]['name'],
                image: data[index]['imageUrl'],
                price: data[index]['price'].toString(),
              );
            },
          );
        },
      ),
    );
  }
}
