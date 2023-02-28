import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/core/ext.dart';
import 'package:tuanis_sidebar/src/item.dart';

/// The main widget for building the sidebar
///
/// [selectedItemId] The initial selected item id
/// [selectedColor] Defines the color used for icons and text when the list tile is selected.
/// [selectedTileColor] Defines the background color of ListTile when [selected] is true.
/// [iconColor] Defines the default color for [leading] and [trailing] icons.
/// [textColor] Defines the default color for the [title] and [subtitle].
/// [focusColor] The color for the tile's [Material] when it has the input focus.
/// [hoverColor] The color for the tile's [Material] when a pointer is hovering over it.
/// [splashColor] The color of splash for the tile's [Material].
/// [tileColor] Defines the background color of ListTile when [selected] is false.
class TuanisSidebar extends StatefulWidget {
  final List<TuanisSidebarItem> items;
  final String? selectedItemId;

  final Color? selectedColor;
  final Color? selectedTileColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? tileColor;

  TuanisSidebar({
    super.key,
    required this.items,
    this.selectedItemId,
    this.selectedColor,
    this.selectedTileColor,
    this.iconColor,
    this.textColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.tileColor,
  }) {
    assert(_allItemIdsAreUnique());
  }

  @override
  State<StatefulWidget> createState() => _TuanisSidebar();

  bool _allItemIdsAreUnique() {
    return items.map((item) => item.id).toSet().length == items.length;
  }
}

class _TuanisSidebar extends State<TuanisSidebar> {
  /// the width of the sidebar
  final double _width = 250;

  /// current selected item
  String? _currentSelectedItemId;

  List<String> _expandedItemIds = [];

  @override
  void initState() {
    super.initState();

    _currentSelectedItemId = widget.selectedItemId;
    _expandedItemIds = [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: _width,
        child: _getItems(widget.items, level: 1),
      ),
    );
  }

  /// Returns a Column where each child can have another Column with sub-items
  /// This method is called recursively
  /// [items] The children of the Column currently being rendered
  Widget? _getItems(List<TuanisSidebarItem> items, {required int level}) {
    if (items.isEmpty) {
      return null;
    }

    List<Widget> children = [];
    for (int i = 0; i < items.length; i++) {
      children.add(_addExtraAttributesToItem(item: items[i], level: level));
      if (_expandedItemIds.contains(items[i].id)) {
        // render sub-items only if the current item is expanded
        final subItems = _getItems(items[i].items, level: level + 1);
        if (subItems != null) {
          children.add(subItems);
        }
      }
    }

    return Column(
      children: children,
    );
  }

  TuanisSidebarItem _addExtraAttributesToItem(
      {required TuanisSidebarItem item, required int level}) {
    return item.copyWith(
      extIsSelected: _currentSelectedItemId == item.id,
      extTile: item.tile.setDefaults(
        defaultContentPadding: EdgeInsets.only(left: level * 16, right: 16),
        defaultSelectedColor: widget.selectedColor,
        defaultSelectedTileColor: widget.selectedTileColor,
        defaultIconColor: widget.iconColor,
        defaultTextColor: widget.textColor,
        defaultFocusColor: widget.focusColor,
        defaultHoverColor: widget.hoverColor,
        defaultSplashColor: widget.splashColor,
        defaultTileColor: widget.tileColor,
        defaultOnTap: () {
          setState(() {
            // show the item as selected only if it is a leaf
            if (item.items.isEmpty) {
              _currentSelectedItemId = item.id;
            } else {
              // expand sub-menu
              if (_expandedItemIds.contains(item.id)) {
                _expandedItemIds.remove(item.id);
              } else {
                _expandedItemIds.add(item.id);
              }
            }

            // call user's event if not null and the item doesn't have nested items
            if (item.tile.onTap != null && item.items.isEmpty) {
              item.tile.onTap!();
            }
          });
        },
      ),
    );
  }
}
