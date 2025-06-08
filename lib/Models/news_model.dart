class NewsModel {
  List<dynamic>news ;
  NewsModel({required this.news});
  factory NewsModel.fromJson(Map<String,dynamic>data)
  {
    final articles = data['articles'] ?? [];

    // Optional: debug print for each article
    for (int i = 0; i < articles.length; i++) {
      print("news model ${articles[i]}");
    }
     return NewsModel(news: data['articles'] ?? [],);

  }
}
