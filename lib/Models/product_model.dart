class ProductModel
{
  List<dynamic>products;
  ProductModel({required this.products});
  factory ProductModel.fetchData(Map<String,dynamic>data)
  {
     return ProductModel(products: data['response']);
  }
}