import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_icons.dart';

class CustomAppbarFavorite extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbarFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppIcons.leftButton),
        ),
      ),
      title: const Text('Favorite repos list'),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
