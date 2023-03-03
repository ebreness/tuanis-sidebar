import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/core/ext.dart';
import 'package:tuanis_sidebar/src/core/state.dart';

/// Represents an item in the sidebar
///
/// [id] The item identifier. Used to know if this is the active item
/// [tile] A ListTile component. The properties of this component will override any property from the Sidebar component
/// [expandIcon] The icon to show when the item has subitems. The default value is `arrow_forward_ios`
/// [isSelected] If true, then the item is shown as selected
/// [items] The sub-items
class TuanisSidebarItem extends StatefulWidget {
  /// The item identifier. Used to know if this is the active item
  final String id;

  /// A ListTile component. The properties of this component will override any property from the Sidebar component
  /// If the tile Icon is not defined, the "abc" icon will be shown in collapse view
  final ListTile tile;

  /// The icon to show when the item has subitems. The default value is `arrow_forward_ios`
  final Icon? expandIcon;

  /// If true, then the item is shown as selected
  final bool isSelected;

  /// The sub-items
  final List<TuanisSidebarItem> items;

  /// Message to display when the item is hovered
  final Text? tooltip;

  const TuanisSidebarItem({
    super.key,
    required this.id,
    required this.tile,
    this.expandIcon = const Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
    this.isSelected = false,
    this.items = const [],
    this.tooltip,
  });

  @override
  State<StatefulWidget> createState() => _TuanisSidebarItem();

  TuanisSidebarItem copyWith({required ListTile extTile, required bool extIsSelected}) {
    return TuanisSidebarItem(
      id: id,
      tile: extTile,
      expandIcon: expandIcon,
      isSelected: extIsSelected,
      items: items,
      tooltip: tooltip,
    );
  }
}

class _TuanisSidebarItem extends State<TuanisSidebarItem> {
  @override
  void initState() {
    super.initState();
    assert(widget.tile.leading == null || widget.tile.leading is Icon);
  }

  @override
  Widget build(BuildContext context) {
    final isSidebarCollapse = SidebarState.of(context)?.isCollapse ?? false;

    Widget itemBody = Material(
      child: widget.tile.setDefaults(
        defaultSelected: widget.isSelected,
        defaultTrailing: widget.items.isNotEmpty ? const Icon(Icons.arrow_forward_ios) : null,
      ),
    );

    if (isSidebarCollapse) {
      final icon = ((widget.tile.leading ?? const Icon(Icons.abc)) as Icon).setDefaults(
        defaultColor: widget.isSelected ? widget.tile.selectedTileColor : widget.tile.iconColor,
      );
      itemBody = Center(
        child: IconButton(
          icon: icon,
          onPressed: widget.tile.onTap,
        ),
      );

      if (widget.tooltip != null) {
        return Tooltip(
          message: widget.tooltip!.data ?? '',
          textStyle: widget.tooltip!.style,
          child: itemBody,
        );
      }
    }

    return itemBody;
  }
}
