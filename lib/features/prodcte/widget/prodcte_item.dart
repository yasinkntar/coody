import 'package:coody/core/models/prodcte_model.dart';
import 'package:coody/core/utils/size_config.dart';
import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdcteItemV extends StatefulWidget {
  const ProdcteItemV({super.key, required this.prodcte});
  final Prodcte prodcte;
  @override
  State<ProdcteItemV> createState() => _ProdcteItemVState();
}

class _ProdcteItemVState extends State<ProdcteItemV> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 150,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 175,
                  child: Text(
                    widget.prodcte.fullname,
                    softWrap: true,
                    maxLines: 2,
                    style:
                        getbodyStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(5),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.prodcte.description,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: getsmallStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffA0A5BA)),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text('EG ${widget.prodcte.price}',
                        style: getbodyStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    const Gap(15),
                    // Container(
                    //   padding: const EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //   child: Row(children: [
                    //     const Icon(
                    //       Icons.discount_sharp,
                    //       color: Colors.white,
                    //       size: 16,
                    //     ),
                    //     const Gap(10),
                    //     Text('15 %',
                    //         style: getbodyStyle(
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.normal,
                    //             color: Colors.white)),
                    //   ]),
                    // )
                  ],
                )
              ],
            ),
            Container(
              width: 120,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.prodcte.urlimage,
                      ),
                      fit: BoxFit.fill),
                  color: const Color(0xffD0D9E1)),
            ),
          ]),
        ),
        const Divider(),
        const Gap(10)
      ],
    );
  }
}
