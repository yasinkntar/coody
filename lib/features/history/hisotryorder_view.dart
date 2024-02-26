import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/history/widget/listorder_ongonig.dart';
import 'package:coody/features/history/widget/lostorder_history.dart';
import 'package:flutter/material.dart';

class HistoryOrderView extends StatefulWidget {
  const HistoryOrderView({super.key});

  @override
  State<HistoryOrderView> createState() => _HistoryOrderViewState();
}

class _HistoryOrderViewState extends State<HistoryOrderView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 60,
          leading: Container(
            margin: const EdgeInsets.only(top: 5, left: 15),
            width: double.infinity,
            height: 49,
            child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45,
                  height: 49,
                  decoration: const BoxDecoration(
                      color: Color(0xffECF0F4), shape: BoxShape.circle),
                  child: Image.asset('assets/back.png',
                      color: const Color(0xff212029)),
                ),
              ),
            ]),
          ),
          title: Text(
            'My Orders',
            style: getbodyStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          bottom: TabBar(
            dividerColor: const Color(0xffCED7DF),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.colorprimer,
            indicatorColor: AppColors.colorprimer,
            labelStyle: getbodyStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: getbodyStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xffA5A7B9)),
            automaticIndicatorColorAdjustment: true,
            tabs: const [
              Tab(
                text: 'Ongoing',
              ),
              Tab(text: "History"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [ListOrderOngoing(), ListOrderHistory()],
        ),
      ),
    );
  }
}
