
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/checkout/models/paymentid.dart';
import 'package:coody/features/checkout/widget/card_widget.dart';
import 'package:coody/features/checkout/widget/paymenttype.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum TypePayment { visa, cash }

class PaymentComp extends StatefulWidget {
  const PaymentComp(
      {super.key, required this.onSelectedItem, required this.onSelectedtype});
  final ValueChanged<PaymentID> onSelectedItem;
  final ValueChanged<TypePayment> onSelectedtype;
  @override
  State<PaymentComp> createState() => _PaymentCompState();
}

class _PaymentCompState extends State<PaymentComp> {
  TypePayment typePayment = TypePayment.cash;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type Payment', style: getbodyStyle(fontWeight: FontWeight.bold)),
        const Gap(15),
        Row(
          children: [
            InkWell(
              onTap: () => setState(() {
                typePayment = TypePayment.cash;
                widget.onSelectedtype.call(typePayment);
              }),
              child: OptionType(
                name: 'Cash',
                selectitem: (typePayment == TypePayment.cash),
                url: 'assets/Cash.png',
              ),
            ),
            const Gap(15),
            InkWell(
              onTap: () => setState(() {
                typePayment = TypePayment.visa;
                widget.onSelectedtype.call(typePayment);
              }),
              child: OptionType(
                name: 'Crite Card',
                selectitem: (typePayment == TypePayment.visa),
                url: 'assets/visa.png',
              ),
            ),
          ],
        ),
        const Gap(15),
        typePayment == TypePayment.visa
            ? CardSelect(
                onSelectedItem: (value) {
                  widget.onSelectedItem.call(value);
                },
              )
            : const SizedBox(),
      ],
    );
  }
}
