import 'package:debting/constants/screen_padding.dart';
import 'package:debting/widgets/common/section.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/views/setting/items/db_setting.dart';
import 'package:debting/widgets/views/setting/items/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: screenPadding,
      children: [
        Section(
          title: Text(
            'Theme',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.5.h),
          ),
          content: ThemeSetting(),
        ),
        Spacing(),
        Section(
          title: Text(
            'Data',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.5.h),
          ),
          content: DbSetting(),
        ),
      ],
    );
  }
}
