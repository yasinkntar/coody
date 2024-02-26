import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemCatgory extends StatelessWidget {
  const ItemCatgory({
    super.key,
    required this.model,
  });
  final CategoriesModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
          padding: const EdgeInsets.fromLTRB(8, 8, 21, 8),
          height: 60,
          decoration: BoxDecoration(
            color: model.selete ? AppColors.selectitem : AppColors.white,
            borderRadius: BorderRadius.circular(39),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffefe6e1),
                offset: Offset(0, 3),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              // rectangle239Em (218:4471)
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: const Color(0xff98a8b8),
                  image: DecorationImage(
                      image: NetworkImage(model.urlimage), fit: BoxFit.fill)),
            ),
            Container(
              // allrey (218:4590)
              margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
              child: Text(model.text,
                  style: getbodyStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.titlecolor)),
            ),
          ]),
        ),
        const Gap(1)
      ],
    );
  }
}
