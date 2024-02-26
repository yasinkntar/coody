import 'package:coody/core/functions/routing.dart';
import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:coody/features/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({Key? key, required this.list}) : super(key: key);
  final List<ProdcteApp> list;
  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  bool isvible = false;

  @override
  Widget build(BuildContext context) {
    double total = widget.list.fold(0, (p, c) => p + c.prodctetotalprice);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isvible = !isvible;
                });
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/receipt.svg"),
                  ),
                  const Spacer(),
                  Text(
                    "Add voucher code",
                    style: getbodyStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xffFF7622),
                  )
                ],
              ),
            ),
            isvible
                ? Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Discount 10%',
                        style: getbodyStyle(
                            fontSize: 14, color: AppColors.colorprimer),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      style: getbodyStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "\$$total",
                          style: getbodyStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Buton(
                  text: 'Check Out',
                  ontap: () {
                    pushTo(context, const CheckoutView());
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
