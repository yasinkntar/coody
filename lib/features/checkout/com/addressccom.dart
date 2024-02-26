import 'package:coody/features/checkout/models/addresscid.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/checkout/widget/addressc_card.dart';
import 'package:coody/features/checkout/widget/paymenttype.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum TypeReceiving { pickup, delivery }

class AddresscComp extends StatefulWidget {
  const AddresscComp(
      {super.key, required this.onSelectedItem, required this.onSelectedtype});
  final ValueChanged<Addressca> onSelectedItem;
  final ValueChanged<TypeReceiving> onSelectedtype;
  @override
  State<AddresscComp> createState() => _AddresscCompState();
}

class _AddresscCompState extends State<AddresscComp> {
  TypeReceiving typeReceiving = TypeReceiving.pickup;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type Receiving',
            style: getbodyStyle(fontWeight: FontWeight.bold)),
        const Gap(15),
        Row(
          children: [
            InkWell(
              onTap: () => setState(() {
                typeReceiving = TypeReceiving.pickup;
                widget.onSelectedtype.call(typeReceiving);
              }),
              child: OptionType(
                name: 'Pickup',
                selectitem: (typeReceiving == TypeReceiving.pickup),
                url: 'assets/supermaket.png',
              ),
            ),
            const Gap(15),
            InkWell(
              onTap: () => setState(() {
                typeReceiving = TypeReceiving.delivery;
                widget.onSelectedtype.call(typeReceiving);
              }),
              child: OptionType(
                name: 'Delivery',
                selectitem: (typeReceiving == TypeReceiving.delivery),
                url: 'assets/delivery.png',
              ),
            ),
          ],
        ),
        const Gap(15),
        typeReceiving == TypeReceiving.delivery
            ? AddresscCard(
                onSelectedItem: (value) {
                  widget.onSelectedItem.call(value);
                },
              )
            : const SizedBox(),
      ],
    );
  }
}
