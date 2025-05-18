import 'package:flutter/material.dart';
import 'package:library_app/widgets/category_item.dart';
import '../app_data.dart';

class CategoryScreen extends StatelessWidget {
  static const screenRoute = '/category-screen';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children:
            Categories_data.map(
              (categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                imageUrl: categoryData.imageUrl,
              ),
            ).toList(),
      ),
    );
  }
}
