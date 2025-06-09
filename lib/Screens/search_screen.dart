import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/weather_screen.dart';
import 'package:untitled/Widgets/custom_textformfeild.dart';

import 'category_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.home),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
          }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textEditingController: searchController,
                    icon: Icons.search,
                    content: "Search",
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherScreen(city: searchController.text),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a city name")),
                        );
                      }
                    },
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
