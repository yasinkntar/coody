import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/profile/model/profileitem.dart';
import 'package:coody/features/profile/widget/barwidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key, required this.onSelectedItem});
  final ValueChanged<ProfileItem> onSelectedItem;
  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(15),
        BarWidget(
          lsit: Profilegroupe.groupe.map(buildMenuItem).toList(),
        ),
        const Gap(15),
        BarWidget(
          lsit: Profilegroupe.groupe2.map(buildMenuItem).toList(),
        ),
        const Gap(15),
        BarWidget(
          lsit: Profilegroupe.groupe3.map(buildMenuItem).toList(),
        ),
        const Gap(15),
        BarWidget(
          lsit: Profilegroupe.groupe4.map(buildMenuItem).toList(),
        )
      ],
    );
  }

  Widget buildMenuItem(ProfileItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          minLeadingWidth: 20,
          leading: Container(
              width: 45,
              height: 49,
              decoration:
                  BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
              child: Image.asset(item.icon)),
          trailing: Image.asset('assets/to.png'),
          title: Text(item.title,
              style: getbodyStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)
              // style: styles(18, FontWeight.bold, Colors.white),
              ),
          onTap: () {
            widget.onSelectedItem.call(item);
          },
        ),
      );
}
