import 'package:flutter/material.dart';
import 'package:untitled/Screens/product_screen.dart';
import 'package:untitled/Screens/random_users_screen.dart';
import 'package:untitled/Screens/search_screen.dart';
import 'package:untitled/Widgets/custom_box.dart';

import 'news_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        itemCount: 4,


        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                 if(index ==0)
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsScreen()));
                   }
                 else if(index ==1)
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> RandomUsersScreen()));
                   }
                 else if(index ==2)
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                   }
                 else if(index == 3)
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductScreen()));
                   }
              },
              child: CustomBox(
                icons: _getIconForIndex(index),
                 content: _getTitleForIndex(index),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.newspaper;
      case 1:
        return Icons.supervised_user_circle_sharp;
      case 2:
        return Icons.wb_sunny; // fixed 'Icons.weather' to valid icon
      case 3:
        return Icons.category;
      default:
        return Icons.help;
    }
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'News';
      case 1:
        return 'Users';
      case 2:
        return 'Weather';
      case 3:
        return 'Categories';
      default:
        return 'Unknown';
    }
  }
}
