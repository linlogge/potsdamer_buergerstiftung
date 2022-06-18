import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final int index;

  String addZero(int number) {
    return number < 10 ? "0$number" : index.toString();
  }

  const NavigationItem({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: TW3Colors.slate.shade900,
      horizontalTitleGap: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addZero(index),
            style: TextStyle(
                color: TW3Colors.slate.shade500,
                fontSize: 10,
                letterSpacing: 1,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 4),
          Text(
            'Veranstaltungen',
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: TW3Colors.slate.shade900,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 45),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/logo.svg",
                width: 150,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const NavigationItem(
            title: 'Veranstaltungen',
            index: 1,
          ),
        ],
      ),
    );
  }
}
