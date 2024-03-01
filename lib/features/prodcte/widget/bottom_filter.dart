import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

showBFilterDialog(BuildContext context, List<CategoriesModel> list) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(list[index].text));
            },
          ),
        );
      });
}
