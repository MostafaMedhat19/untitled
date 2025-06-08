import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/news_provider.dart';
import 'package:untitled/Screens/news_details_screen.dart';

class CustomCard extends StatelessWidget {
  int index ; 
  String image ;
  String name ;
  String title ;
   CustomCard({super.key, required this.image , required this.name , required this.title , required this.index});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<NewsProvider>(context, listen: false).newsModel?.news;
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(
              image:obj?[index]["urlToImage"] ,
              title:obj?[index]["title"],
              description: obj?[index]["description"],
              content:obj? [index]["content"],
              publishedAt: obj?[index]["publishedAt"],
              author: obj?[index]["author"]),));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
           shadowColor: Colors.black,
          elevation: 4.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Image.network(image,  width: 400,height: 400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name , style:  TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
