import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/core/widgets/custom_dialogs.dart';
import 'package:coody/features/checkout/bloc/checkout_cubit.dart';
import 'package:coody/features/checkout/bloc/checkout_state.dart';
import 'package:coody/features/checkout/com/addressccom.dart';
import 'package:coody/features/checkout/com/paymentconp.dart';
import 'package:coody/features/checkout/widget/list_price.dart';
import 'package:coody/features/drawer/drawer_screen.dart';
import 'package:coody/features/tackorder/taceorder_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    context.read<CheckoutCubit>().getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutStates>(
        listener: (context, state) {
      if (state is CheckoutLodingState) {
        showLoadingDialog(context);
      } else if (state is CheckoutErrorState) {
        Navigator.pop(context);
        showErrorDialog(context, state.error);
      } else if (state is PalecOrderSuccessState) {
        pushAndRemoveUntil(context, const DrawerScreen());
        pushTo(
            context,
            TackOrderView(
              uid: state.uuid,
            ));
      } else if (state is CheckoutSuccessState) {
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: appBars(
          context: context,
          isback: true,
          titte: Text(
            'Check Out',
            style: getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(30),
                PaymentComp(
                  onSelectedItem: (value) {
                    context.read<CheckoutCubit>().changeditempayment(value);
                  },
                  onSelectedtype: (value) {
                    context.read<CheckoutCubit>().changedtypepayment(value);
                  },
                ),
                AddresscComp(onSelectedItem: (value) {
                  context.read<CheckoutCubit>().changeditemReceiving(value);
                }, onSelectedtype: (value) {
                  context.read<CheckoutCubit>().changedtypeReceiving(value);
                }),
                const Gap(15),
                const Divider(),
                ListPrice(
                  name: 'Total Items',
                  value: context.read<CheckoutCubit>().totalitems,
                ),
                ListPrice(
                    name: 'Total Tax',
                    value: context.read<CheckoutCubit>().tataltax),
                ListPrice(
                    name: 'Total Discount',
                    value: context.read<CheckoutCubit>().discout),
                ListPrice(
                    name: 'Delivery Serives',
                    value: context.read<CheckoutCubit>().deilverservsie),
                const Divider(),
                ListPrice(
                  name: 'Total',
                  fontWeight: FontWeight.bold,
                  value: context.read<CheckoutCubit>().net,
                  color: AppColors.colorprimer,
                ),
                const Divider(),
                const Gap(10),
                Buton(
                    text: 'Order Placed',
                    ontap: () {
                      context.read<CheckoutCubit>().palechorder();
                    })
              ],
            ),
          ),
        )),
      );
    });
  }
}
