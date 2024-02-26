import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';

class QtyItem extends StatefulWidget {
  const QtyItem(
      {super.key,
      required this.onSelectedItem,
      this.isdark = false,
      this.value = 1});
  final ValueChanged<int> onSelectedItem;
  final bool isdark;
  final int value;
  @override
  State<QtyItem> createState() => _QtyItemState();
}

class _QtyItemState extends State<QtyItem> {
  int qty = 1;
  @override
  void initState() {
    qty = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 45,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widget.isdark ? AppColors.scaffoldBGdark : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (qty > 1) {
                  qty--;
                  widget.onSelectedItem.call(qty);
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isdark
                      ? Colors.white.withOpacity(0.4)
                      : Colors.white),
              child: Icon(
                Icons.remove,
                color: widget.isdark ? Colors.white : AppColors.colorprimer,
              ),
            ),
          ),
          Text('$qty',
              style: getbodyStyle(
                  fontSize: 15,
                  color: widget.isdark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {
              setState(() {
                qty++;
                widget.onSelectedItem.call(qty);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isdark
                      ? Colors.white.withOpacity(0.4)
                      : Colors.white),
              child: Icon(
                Icons.add,
                color: widget.isdark ? Colors.white : AppColors.colorprimer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
