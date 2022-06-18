import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class Header extends AppBar {
  final BuildContext context;

  Header({Key? key, required this.context}) : super(key: key);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  TextStyle? get titleTextStyle => Theme.of(context).textTheme.headline6;

  @override
  IconThemeData? get iconTheme => Theme.of(context).iconTheme;

  @override
  Widget? get title => Text("Hallo Welt");

  /* @override
  Widget? get leading => CircleAvatar(
        radius: 30,
        backgroundColor: TWColors.gray.shade100,
        child: IconButton(
          icon: HeroIcon(HeroIcons.menuAlt2),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ); */
}
