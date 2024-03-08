import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/qty_widget.dart';
import 'package:flutter/material.dart';
import 'package:coody/core/utils/size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard(
      {Key? key, required this.prodcteApp, required this.onchangedItem})
      : super(key: key);
  final ProdcteApp prodcteApp;
  final ValueChanged<int> onchangedItem;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                // padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  widget.prodcteApp.prodcteimage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: SizeConfig.screenWidth - 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.prodcteApp.prodctename,
                  style: getbodyStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  maxLines: 2,
                ),
                Text(
                  widget.prodcteApp.prodctenotes.isEmpty
                      ? ''
                      : 'Notes: ${widget.prodcteApp.prodctenotes}',
                  style: getbodyStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(
                      "\$${widget.prodcteApp.prodctetotalprice}",
                      style: getbodyStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                    // const Gap(50),
                    QtyItem(
                      value: widget.prodcteApp.prodcteqty.toInt(),
                      onSelectedItem: (value) {
                        widget.onchangedItem.call(value);
                      },
                      isdark: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
