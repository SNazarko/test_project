import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_icons.dart';
import '../../favorite_page/favorite_page.dart';

class CustomAppbarHome extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  const Text('Github repos list',
      ),
      actions: [
        GestureDetector(
          onTap: ()=> Navigator.pushNamed(context, FavoritePage.routeName),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(AppIcons.favorite2,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
