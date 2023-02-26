import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/item.dart';

/// The main widget for building the sidebar
///
/// [selectedItemId] The initial selected item id
/// [fontColor] The font color of the item
/// [hoverColor] The background color when the item is hovered. Except if the item is selected
/// [selectedFontColor] The font color of the item when it is selected
/// [selectedBackgroundColor] The background color of the item when it is selected
/// [itemBackgroundColor] The background color of the item when it is NOT selected
/// [leadingIconColor] The color of the leading icon when the item is NOT selected
/// [selectedLeadingIconColor] The color of the leading icon when the item is selected
class TuanisSidebar extends StatefulWidget {
  final List<TuanisSidebarItem> items;
  final String? selectedItemId;
  final Color? fontColor;
  final Color? hoverColor;
  final Color? selectedFontColor;
  final Color? selectedBackgroundColor;
  final Color? itemBackgroundColor;
  final Color? leadingIconColor;
  final Color? selectedLeadingIconColor;

  TuanisSidebar({
    super.key,
    required this.items,
    this.selectedItemId,
    this.fontColor,
    this.hoverColor,
    this.selectedFontColor,
    this.selectedBackgroundColor,
    this.itemBackgroundColor,
    this.leadingIconColor,
    this.selectedLeadingIconColor,
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

  @override
  void initState() {
    super.initState();

    _currentSelectedItemId = widget.selectedItemId;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: _width,
        child: Column(
          children: _getItems(),
        ),
      ),
    );
  }

  List<TuanisSidebarItem> _getItems() {
    return widget.items
        .map(
          (item) => TuanisSidebarItem(
            id: item.id,
            label: item.label,
            onClick: () {
              setState(() {
                _currentSelectedItemId = item.id;
              });

              /// call user's event
              item.onClick();
            },
            leadingIcon: item.leadingIcon,
            isSelected: _currentSelectedItemId == item.id,
            fontColor: widget.fontColor ?? Theme.of(context).colorScheme.onSurface,
            hoverColor: widget.hoverColor,
            selectedBackgroundColor:
                widget.selectedBackgroundColor ?? Theme.of(context).colorScheme.primary,
            backgroundColor: widget.itemBackgroundColor ?? Theme.of(context).colorScheme.surface,
            selectedFontColor: widget.selectedFontColor ?? Theme.of(context).colorScheme.onPrimary,
            leadingIconColor: widget.leadingIconColor ?? Theme.of(context).colorScheme.primary,
            selectedLeadingIconColor:
                widget.selectedLeadingIconColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        )
        .toList();
  }
}
