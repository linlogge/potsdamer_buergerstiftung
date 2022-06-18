import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String summary;

  const EventCard({Key? key, required this.name, required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TWColors.gray.shade100,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            summary,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
