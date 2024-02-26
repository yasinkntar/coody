import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/home/screens/widget/offers_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

// ignore: must_be_immutable
class OffersComplete extends StatefulWidget {
  OffersComplete({super.key});
  @override
  State<OffersComplete> createState() => _OffersCompleteState();
}

class _OffersCompleteState extends State<OffersComplete> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('offersc')
            .where('isenable', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? const Gap(10)
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Special Offer',
                            style: getbodyStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titlecolor)),
                      ],
                    ),
                    const Gap(15),
                    SizedBox(
                      height: 150,
                      child: AnimatedListView(
                        scrollDirection: Axis.horizontal,
                        duration: 250,
                        extendedSpaceBetween: 30,
                        spaceBetween: 10,
                        children: List.generate(
                            snapshot.data!.size,
                            (index) => GridAnimatorWidget(
                                  child: OffersItem(
                                    data: snapshot.data!.docs[index],
                                  ),
                                )),
                      ),
                    ),
                  ],
                );
        });
  }
}
