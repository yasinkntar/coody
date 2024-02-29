import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/core/widgets/qty_widget.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/cart/bloc/cart_cubit.dart';
import 'package:coody/features/cart/bloc/cart_state.dart';
import 'package:coody/features/prodcte_detile/models/option_menu.dart';
import 'package:coody/features/prodcte_detile/widget/appbar.dart';
import 'package:coody/features/prodcte_detile/widget/button_cart.dart';
import 'package:coody/features/prodcte_detile/widget/choice_item.dart';
import 'package:coody/features/prodcte_detile/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProdcteDetiles extends StatefulWidget {
  const ProdcteDetiles({super.key, required this.uidpodcte});
  final String uidpodcte;

  @override
  State<ProdcteDetiles> createState() => _ProdcteDetilesState();
}

class _ProdcteDetilesState extends State<ProdcteDetiles> {
  double price = 0;
  double totalprice = 0;
  var note = TextEditingController();
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(listener: (context, state) {
      if (state is CartLodingState) {
        showLoadingDialog(context);
      } else if (state is CartErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else if (state is CartSuccessState) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Prodcte')
              .doc(widget.uidpodcte)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var prodcteData = snapshot.data;
            price = double.parse(prodcteData!['price'].toString());
            totalprice = qty * price;
            return Scaffold(
                bottomNavigationBar: ButtonCart(
                  total: totalprice,
                  ontap: () {
                    context.read<CartCubit>().addtocart(ProdcteApp(
                        prodcteid: prodcteData.id,
                        prodctename: prodcteData['fullname'].toString(),
                        prodctenotes: note.text,
                        prodcteprice:
                            double.parse(prodcteData['price'].toString()),
                        prodcteqty: qty.toDouble(),
                        prodctetotalprice: totalprice,
                        prodcteimage: prodcteData['urlimage']));
                  },
                ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(prodcteData['urlimage']),
                                fit: BoxFit.fill),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24)),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: AppBarProdcteDetiles(
                                    prodcteid: prodcteData.id,
       
                                  )))),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  prodcteData['fullname'],
                                  style: getbodyStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Text(
                              prodcteData['catgory'],
                              style: getbodyStyle(color: AppColors.textnorlma),
                            ),
                            const Gap(15),
                            Row(
                              children: [
                                ItemCat(
                                  icons: Icons.star_outline,
                                  text: '4.7',
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Gap(15),
                            Text(
                              prodcteData['description'],
                              maxLines: 3,
                              style: getsmallStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xffA0A5BA)),
                            ),
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$totalprice EG',
                                  style: getTitleStyle(),
                                ),
                                QtyItem(
                                  onSelectedItem: (value) {
                                    setState(() {
                                      qty = value;
                                      totalprice = qty * price;
                                    });
                                  },
                                )
                              ],
                            ),
                            const Gap(10),
                            ChoiceItem(
                              namechoice: 'Size',
                              list: Optiongroupe.size
                                  .map(buildOptionItem)
                                  .toList(),
                              ismandatory: true,
                              onSelectedItem: (item) {},
                            ),
                            const Gap(20),
                            ChoiceItem(
                              namechoice: 'Options',
                              list: Optiongroupe.options
                                  .map(buildOptionItem)
                                  .toList(),
                              ismandatory: false,
                              onSelectedItem: (item) {},
                            ),
                            const Gap(15),
                            TextInput(
                                hinttext: 'Example: without salt',
                                labeltext: 'Notes',
                                maxline: 3,
                                controller: note),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
          });
    });
  }

  Widget buildOptionItem(OptionItem item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style:
                      getbodyStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      '(+${item.price})',
                      style: getbodyStyle(),
                    ),
                    item.isModey
                        ? Radio(
                            value: item.price, groupValue: 0, onChanged: (a) {})
                        : Checkbox(
                            value: true,
                            checkColor: AppColors.white,
                            onChanged: (bol) {})
                  ],
                )
              ],
            ),
            const Gap(10)
          ],
        ),
      );
}
