import 'package:flutter/material.dart';

/// Represents an item in the sidebar
/// [id] The item identifier. Used to know if this is the active item
/// [label] The title of the list tile
/// [onClick] The function to call when this item is pressed
/// [leadingIcon] An icon to show at the start of the list tile
class TuanisSidebarItem extends StatefulWidget {
  final String id;
  final String label;
  final void Function() onClick;
  final IconData? leadingIcon;
  final bool isSelected;

  const TuanisSidebarItem({
    super.key,
    required this.id,
    required this.label,
    required this.onClick,
    this.leadingIcon,
    this.isSelected = false,
  });

  @override
  State<StatefulWidget> createState() => _TuanisSidebarItem();
}

class _TuanisSidebarItem extends State<TuanisSidebarItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leadingIcon != null ? Icon(widget.leadingIcon) : null,
      title: Text(widget.label),
      tileColor: widget.isSelected ? Colors.blue : null,
      onTap: widget.onClick,
    );
  }
}
