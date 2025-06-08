import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/news_provider.dart';
import 'package:untitled/Widgets/custom_card.dart';
import 'package:untitled/Widgets/custom_textformfeild.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shadowColor: Colors.black,
        elevation: 2.4,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    textEditingController: searchController,
                    icon: Icons.search,
                    content: "Search",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final searchText = searchController.text;
                    Provider.of<NewsProvider>(context, listen: false).getData(searchText);
                  },
                  child: const Text("Search"),
                ),
              ],
            ),
            Expanded(
              child: Consumer<NewsProvider>(
                builder: (context, provider, child) {
                  final data = provider.newsModel?.news;

                  if (data == null) {
                    provider.getData(searchController.text);
                    return const Center(child: CircularProgressIndicator());
                  }
                   else
                     {
                       provider.getData(searchController.text);
                       return ListView.separated(
                         itemCount: data.length,
                         separatorBuilder: (context, index) => const SizedBox(height: 5),
                         itemBuilder: (context, index) {
                           return CustomCard(
                             index: index,
                             name: data[index]['source']['name'],
                             image: data[index]['urlToImage'],
                             title: data[index]['title'],
                           );
                         },
                       );
                     }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
