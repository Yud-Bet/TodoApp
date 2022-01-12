import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.title, this.onSaveTap})
      : size = const Size.fromHeight(55),
        super(key: key);

  final Size size;
  final String title;
  final Function()? onSaveTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      shadowColor: Colors.grey[100],
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        Visibility(
          visible: onSaveTap != null,
          child: TextButton(
            onPressed: onSaveTap,
            child: Text('save'.tr),
            style: Theme.of(context).textButtonTheme.style,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => size;
}
