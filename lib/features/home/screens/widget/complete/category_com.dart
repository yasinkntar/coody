import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/categories_model.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/home/screens/widget/item_catgory.dart';
import 'package:coody/features/prodcte/prodcte_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

// ignore: must_be_immutable
class CategoriesComplete extends StatefulWidget {
  const CategoriesComplete({super.key});
  @override
  State<CategoriesComplete> createState() => _CategoriesCompleteState();
}

class _CategoriesCompleteState extends State<CategoriesComplete> {
  List<CategoriesModel>? listcatgory = [];
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .where('visble', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Gap(10);
          }
          listcatgory!.clear();
          listcatgory!.insert(
              0,
              CategoriesModel(
                  selete: true,
                  text: 'All',
                  urlimage:
                      'https://i.ytimg.com/vi/QsCByv3Udpc/maxresdefault.jpg'));
          for (var element in snapshot.data!.docs) {
            listcatgory!.add(CategoriesModel.fromJson(element));
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ALL CATEGORIES',
                      style: getbodyStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.titlecolor)),
                  InkWell(
                    onTap: () async {
                      pushTo(context, const ProdcteView());
                    },
                    child: Row(
                      children: [
                        Text('See All',
                            style: getbodyStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titlecolor)),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  )
                ],
              ),
              const Gap(15),
              SizedBox(
                height: 65,
                child: AnimatedListView(
                  scrollDirection: Axis.horizontal,
                  duration: 250,
                  extendedSpaceBetween: 30,
                  spaceBetween: 10,
                  children: List.generate(
                      listcatgory!.length,
                      (index) => GridAnimatorWidget(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectindex = index;
                                });
                              },
                              child: ItemCatgory(
                                model: listcatgory![index],
                                selectindex: selectindex == index,
                              ),
                            ),
                          )),
                ),
              ),
            ],
          );
        });
  }
}
