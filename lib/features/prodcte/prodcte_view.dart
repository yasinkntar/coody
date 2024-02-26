import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/widgets/item_prodcte.dart';
import 'package:coody/features/prodcte/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

class ProdcteView extends StatefulWidget {
  const ProdcteView({super.key});

  @override
  State<ProdcteView> createState() => _ProdcteViewState();
}

class _ProdcteViewState extends State<ProdcteView> {
  String valuecatgory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AppBarCustome(
              onChanged: (p0) {
                setState(() {
                  valuecatgory = p0!;
                });
              },
              
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valuecatgory != "All" ? 'ALL $valuecatgory' : "ALL",
                  style: GoogleFonts.sen().copyWith(
                    fontSize: 20,
                    color: const Color(0xff31343d),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Prodcte')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        List<Prodcte>? listprodcte = [];
                        List<Prodcte>? listprodcteview = [];
                        snapshot.data?.docs.forEach((element) {
                          listprodcte.add(Prodcte.fromJson(element));
                        });
                        listprodcteview = valuecatgory == "All"
                            ? listprodcte
                            : listprodcte
                                .where((element) =>
                                    element.catgory == valuecatgory)
                                .toList();
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemCount: listprodcteview.length,
                          itemBuilder: (context, index) {
                            return GridAnimatorWidget(
                              child: BurgercomponentItemWidget(
                                  prodcte: listprodcteview![index]),
                            );
                          },
                        );
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
