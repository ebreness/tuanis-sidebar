import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/tuanis_sidebar.dart';

class TuanisSidebarSection extends StatelessWidget {
  final List<TuanisSidebarItem> items;
  final Color? backgroundColor;
  final Color? borderColor;
  final Text? title;

  const TuanisSidebarSection({
    super.key,
    required this.items,
    this.backgroundColor,
    this.borderColor,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: borderColor != null
                ? Border(
                    top: BorderSide(color: borderColor!),
                  )
                : null,
            color: title != null ? backgroundColor : null,
          ),
          child: title,
        ),
        ...items
      ],
    );
  }
}
