import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/textinput_widget.dart';
import 'package:coody/features/cart/cart_screen.dart';
import 'package:coody/features/home/screens/widget/complete/category_com.dart';
import 'package:coody/features/home/screens/widget/complete/offers_com.dart';
import 'package:coody/features/home/screens/widget/complete/prodcte_com.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBars(
          context: context,
          isback: false,
          titte: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver to',
                style: TextStyle(
                    color: const Color(0xffFC6E2A),
                    fontSize: 12,
                    fontFamily: GoogleFonts.sen().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(1),
              Text(
                ' context.re>().location',
                style: TextStyle(
                    color: const Color(0xff676767),
                    fontSize: 14,
                    fontFamily: GoogleFonts.sen().fontFamily,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          ontapAction: () {
            pushTo(context, const CartScreen());
          },
          actioniamage: 'assets/cart.png',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Text.rich(TextSpan(
                        text:
                            'Hey ${FirebaseAuth.instance.currentUser?.displayName}, ',
                        style: getbodyStyle(fontSize: 16),
                        children: <InlineSpan>[
                          TextSpan(
                            text: DateTime.now().hour >= 12
                                ? 'Good Afternoon !'
                                : 'Good morning !',
                            style: getbodyStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ])),

                    const Gap(15),
                    TextInput(
                        controller: TextEditingController(),
                        hinttext: 'Search dishes, food',
                        labeltext: '',
                        showlabel: false,
                        ismandatory: true,
                        isemail: true),
                    // Container(
                    //   width: double.infinity,
                    //   margin: const EdgeInsets.fromLTRB(0, 0, 24, 20),
                    //   padding: const EdgeInsets.fromLTRB(20, 23, 10, 22),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xfff6f6f6),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         const Icon(
                    //           Icons.search,
                    //           size: 20,
                    //           color: Color(0xff676767),
                    //         ),
                    //         const Gap(10),
                    //         Text(
                    //           'Search dishes, food',
                    //           style: GoogleFonts.sen().copyWith(
                    //             fontSize: 14,
                    //             color: const Color(0xff676767),
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         )
                    //       ]),
                    // ),
                    OffersComplete(),
                    const Gap(30),
                    const CategoriesComplete(),
                    const Gap(30),
                    const ProdcteComplete()
                  ]),
            ),
          ),
        ));
  }
}
