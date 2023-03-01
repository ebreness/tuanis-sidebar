import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/tuanis_sidebar.dart';

/// Represents a section of the sidebar containing a list of items
///
/// [items] The items of this section
/// [backgroundColor] The background color of the section. Shown only if [title] is passed
/// [borderColor] Top border color, if null, no border is shown
/// [title] The text to display at the top of the section, before the items
class TuanisSidebarSection extends StatelessWidget {
  /// The items of this section
  final List<TuanisSidebarItem> items;

  /// The background color of the section. Shown only if [title] is passed
  final Color? backgroundColor;

  /// Top border color, if null, no border is shown
  final Color? borderColor;

  /// The text to display at the top of the section, before the items
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
        ...items,
      ],
    );
  }
}
