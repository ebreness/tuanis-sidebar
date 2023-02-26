import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/core/ext.dart';

/// Represents an item in the sidebar
/// [id] The item identifier. Used to know if this is the active item
/// [label] The title of the list tile
/// [onClick] The function to call when this item is pressed
/// [leadingIcon] An icon to show at the start of the list tile
/// [selectedFontColor] The font color for the selected item
class TuanisSidebarItem extends StatefulWidget {
  final String id;
  final String label;
  final void Function() onClick;
  final IconData? leadingIcon;
  final bool isSelected;
  final Color? fontColor;
  final Color? hoverColor;
  final Color? selectedFontColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final Color? leadingIconColor;
  final Color? selectedLeadingIconColor;

  const TuanisSidebarItem({
    super.key,
    required this.id,
    required this.label,
    required this.onClick,
    this.fontColor,
    this.hoverColor,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.selectedFontColor,
    this.leadingIconColor,
    this.selectedLeadingIconColor,
    this.leadingIcon,
    this.isSelected = false,
  });

  @override
  State<StatefulWidget> createState() => _TuanisSidebarItem();
}

class _TuanisSidebarItem extends State<TuanisSidebarItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leadingIcon != null ? Icon(widget.leadingIcon) : null,
      title: Text(
        widget.label,
        style: TextStyle(
          color: widget.isSelected
              ? (widget.selectedFontColor ?? Colors.black)
              : (widget.fontColor ?? Colors.black),
        ),
      ),
      tileColor: widget.isSelected
          ? (widget.selectedBackgroundColor ?? Colors.blue)
          : (widget.backgroundColor ?? const Color(0xfff8fafc)),
      iconColor: widget.isSelected
          ? (widget.selectedLeadingIconColor ?? Colors.black)
          : (widget.leadingIconColor ?? Colors.black),
      hoverColor: widget.isSelected
          ? (widget.selectedBackgroundColor ?? Colors.blue).darken()
          : (widget.hoverColor ?? (widget.backgroundColor ?? const Color(0xfff8fafc)).darken()),
      onTap: widget.onClick,
    );
  }
}
