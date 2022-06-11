import 'package:debting/constant/screen_padding.dart';
import 'package:debting/widget/common/section.dart';
import 'package:debting/widget/common/spacing/column_spacing.dart';
import 'package:debting/widget/screen/setting/config/data_config.dart';
import 'package:debting/widget/screen/setting/config/theme_config.dart';
import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: screenPadding,
      children: [
        Section(title: 'Theme', widget: ThemeConfig()),
        ColumnSpacing(),
        Section(title: 'Data', widget: DataConfig()),
      ],
    );
  }
}
