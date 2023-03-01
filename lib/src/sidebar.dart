import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/core/ext.dart';
import 'package:tuanis_sidebar/src/item.dart';
import 'package:tuanis_sidebar/src/section.dart';

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
  /// Organize items into sections
  final List<TuanisSidebarSection> sections;

  ///  Control how the sections are spread within the Column
  final MainAxisAlignment sectionsAligment;

  /// The initial selected item id
  final String? selectedItemId;

  /// Defines the color used for icons and text when the list tile is selected. (Applies to all items)
  final Color? selectedColor;

  /// Defines the background color of ListTile when [selected] is true. (Applies to all items)
  final Color? selectedTileColor;

  /// Defines the default color for [leading] and [trailing] icons. (Applies to all items)
  final Color? iconColor;

  /// Defines the default color for the [title] and [subtitle]. (Applies to all items)
  final Color? textColor;

  /// The color for the tile's [Material] when it has the input focus. (Applies to all items)
  final Color? focusColor;

  /// The color for the tile's [Material] when a pointer is hovering over it. (Applies to all items)
  final Color? hoverColor;

  /// The color of splash for the tile's [Material]. (Applies to all items)
  final Color? splashColor;

  /// Defines the background color of ListTile when [selected] is false.  (Applies to all items)
  final Color? tileColor;

  TuanisSidebar({
    super.key,
    required this.sections,
    this.sectionsAligment = MainAxisAlignment.spaceBetween,
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
    final allItems = sections.map((s) {
      return [...s.items][0]; // sorry for this
    }).toList();
    return allItems.map((item) => item.id).toSet().length == allItems.length;
  }
}

class _TuanisSidebar extends State<TuanisSidebar> {
  final double _width = 250;
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
      child: Container(
        width: _width,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: widget.sectionsAligment,
          children: _getSections(),
        ),
      ),
    );
  }

  List<TuanisSidebarSection> _getSections() {
    return widget.sections
        .map(
          (e) => TuanisSidebarSection(
            backgroundColor: e.backgroundColor,
            borderColor: e.borderColor,
            title: e.title,
            items: _getItems(e.items, level: 1) as List<TuanisSidebarItem>,
          ),
        )
        .toList();
  }

  List<TuanisSidebarItem>? _getItems(List<TuanisSidebarItem> items, {required int level}) {
    if (items.isEmpty) {
      return null;
    }

    List<TuanisSidebarItem> children = [];
    for (int i = 0; i < items.length; i++) {
      children.add(_addExtraAttributesToItem(item: items[i], level: level));
      if (_expandedItemIds.contains(items[i].id)) {
        // render sub-items only if the current item is expanded
        final subItems = _getItems(items[i].items, level: level + 1);
        if (subItems != null) {
          children.addAll(subItems);
        }
      }
    }

    return children;
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
