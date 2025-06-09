import 'package:flutter/material.dart';
import 'package:untitled/Models/product_model.dart';
import 'package:untitled/Services/product.service.dart';

class ProductProvider extends ChangeNotifier
{
    ProductModel? model ;
    Future<void>productData() async
    {
      model = await ProductService.getProduct();
      notifyListeners();
    }
}