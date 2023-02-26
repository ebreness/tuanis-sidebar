import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/src/item.dart';

/// The main widget for building the sidebar
/// [selectedItemId] The initial selected item id
class TuanisSidebar extends StatefulWidget {
  final List<TuanisSidebarItem> items;
  final String? selectedItemId;

  const TuanisSidebar({super.key, required this.items, this.selectedItemId});

  @override
  State<StatefulWidget> createState() => _TuanisSidebar();
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
    return SizedBox(
      width: _width,
      child: Column(
        children: _getItems(),
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
          ),
        )
        .toList();
  }
}
