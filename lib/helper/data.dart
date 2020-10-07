import 'dart:ui';

import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();
  //1
  categoryModel.categoryName = 'Business';
  categoryModel.color = Color(0xFFFFACAC);
  category.add(categoryModel);
  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.color = Color(0xFF86E3CE);
  category.add(categoryModel);
  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.color = Color(0xFFFFDD95);
  category.add(categoryModel);
  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.color = Color(0xFFD0E6A5);
  category.add(categoryModel);
  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.color = Color(0xFFCCAAD9);
  category.add(categoryModel);
  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.color = Color(0xFF57EF7A);
  category.add(categoryModel);
  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.color = Color(0xFFE8BA24);
  category.add(categoryModel);

  return category;
}
