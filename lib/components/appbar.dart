import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;
  const appBar({Key? key,required this.title1, required this.title2})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    String modifyTitle = '${title1[0].toUpperCase()}${title1.substring(1)} ';
    return AppBar(
      // actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: modifyTitle, size: 20, color: AppColors.primary),
            ModifiedText(
              text: title2,
              size: 20,
              color: AppColors.lightWhite,
            )
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
