import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/features/cart/bloc/cart_cubit.dart';
import 'package:coody/features/cart/bloc/cart_state.dart';
import 'package:coody/features/cart/widget/appbar.dart';
import 'package:coody/features/cart/widget/cart_card.dart';
import 'package:coody/features/cart/widget/check_out_card.dart';
import 'package:coody/features/cart/widget/emptycart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().fetchAllProdcte();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(listener: (context, state) {
      if (state is CartLodingState) {
        // showLoadingDialog(context);
      } else if (state is CartErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else if (state is CartSuccessState) {}
    }, builder: (context, state) {
      List<ProdcteApp>? prodctelist = context.read<CartCubit>().notes;
      if (prodctelist!.isEmpty) {
        return const EmpatyCart();
      }

      return Scaffold(
        backgroundColor: AppColors.scaffoldBGdark,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const AppBarcard(),
                Expanded(
                  child: ListView.builder(
                    itemCount: prodctelist.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            prodctelist.removeAt(index);
                            context.read<CartCubit>().removecartat(index);
                          });
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10101b),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Lottie.asset("assets/Trash.json"),
                            ],
                          ),
                        ),
                        child: CartCard(
                          prodcteApp: prodctelist[index],
                          onchangedItem: (value) {
                            context.read<CartCubit>().updateqty(value, index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            CheckoutCard(list: context.read<CartCubit>().notes!),
      );
    });
  }
}
