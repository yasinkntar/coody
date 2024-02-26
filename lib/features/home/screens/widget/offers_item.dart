import 'package:coody/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({super.key, required this.data});
  // ignore: prefer_typing_uninitialized_variables
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 327,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffefe6e1),
              offset: Offset(0, 3),
              blurRadius: 2,
            ),
          ],
          color: Color(int.parse(data["backgroundColor"]))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '%${data["rate"]}',
                style: getbodyStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse(data["FontColor"]))),
              ),
              const Gap(10),
              SizedBox(
                  width: 120,
                  child: Text(
                    data["descption"],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: getbodyStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(data["FontColor"]))),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.network(
            data["imageurl"],
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }
}
