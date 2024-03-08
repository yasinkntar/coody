import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/core/widgets/appbars.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isacative = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars(
        context: context,
        isback: true,
        titte: Text(
          'Settings',
          style: getappbartextStyle(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                'Language',
                style: getbodyStyle(),
              ),
              trailing: SizedBox(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colorprimer,
                      ),
                      label: Text(
                        'En',
                        style: getbodyStyle(color: AppColors.colorprimer),
                      ))),
            ),
            ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(
                  'Theme',
                  style: getbodyStyle(),
                ),
                trailing: Switch(
                  onChanged: (p0) {
                    setState(() {
                      isacative = p0;
                    });
                  },
                  activeColor: AppColors.colorprimer,
                  value: isacative,
                ))
          ],
        ),
      )),
    );
  }
}
