import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemOrder extends StatefulWidget {
  const ItemOrder(
      {super.key,
      this.data,
      required this.uid,
      required this.ontap,
      required this.buttontext,
      required this.outlinetext,
      required this.outline});
  final data;
  final String uid;
  final Function outline;
  final Function ontap;
  final String outlinetext;
  final String buttontext;
  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  String getstate(int index) {
    switch (index) {
      case 0:
        return 'Acceptance';
      case 1:
        return 'In preparation';
      case 2:
        return 'Delivery';
      case 3:
        return 'Completed';
      case 4:
        return 'Order Denied';
      case 5:
        return 'Cancel';
      default:
        return 'Eerror';
    }
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.grey.shade600;
      case 1:
        return Colors.black;
      case 2:
        return AppColors.colorprimer;
      case 3:
        return Colors.green;
      case 4:
      case 5:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.data['DateOrderd'];
    timeago.format(DateTime.parse(timestamp.toDate().toString())).toString();
    return Container(
      width: double.infinity,
      // height: 200,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Status  ',
                style: getbodyStyle(
                  fontSize: 14,
                ),
              ),
              const Gap(20),
              Text(
                getstate(int.parse(widget.data['status'].toString())),
                style: getbodyStyle(
                    color:
                        getColor(int.parse(widget.data['status'].toString())),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Gap(5),
          const Divider(),
          const Gap(10),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // image: DecorationImage(image: NetworkImage()),
                      color: const Color(0xffD0D9E1)),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(6),
                    Text(
                      '#1256845',
                      style: getbodyStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'EG ${double.parse(widget.data["Net"].toString()).toStringAsFixed(2)}',
                          style: getbodyStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const Gap(5),
                        Text(
                          '|',
                          style: getbodyStyle(
                              fontSize: 14, color: Color(0xff6B6E82)),
                        ),
                        const Gap(5),
                        Text(
                          '${List.from(widget.data["Items"]).length} items',
                          style: getbodyStyle(
                              fontSize: 14, color: Color(0xff6B6E82)),
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Gap(5),
                    Text(
                      timeago
                          .format(
                            DateTime.parse(timestamp.toDate().toString()),
                          )
                          .toString(),
                      style:
                          getbodyStyle(fontSize: 14, color: Color(0xff6B6E82)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(5),
          const Divider(),
          const Gap(5),
          Row(
            children: [
              Expanded(
                  child: Buton(
                hidget: 50,
                text: widget.buttontext,
                ontap: () {
                  widget.ontap.call();
                },
              )),
              const Gap(10),
              Expanded(
                  child: InkWell(
                onTap: () {
                  widget.outline.call();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffff7622),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(widget.outlinetext,
                        textAlign: TextAlign.center,
                        style: getbodyStyle(
                            fontSize: 14,
                            color: const Color(0xffff7622),
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
