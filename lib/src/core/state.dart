import 'package:flutter/material.dart';

class SidebarState extends InheritedWidget {
  /// Wether the sidebar is collapse or not
  final isCollapse;

  const SidebarState({super.key, required Widget child, this.isCollapse = false})
      : super(child: child);

  @override
  bool updateShouldNotify(SidebarState oldWidget) => isCollapse != oldWidget.isCollapse;

  static SidebarState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SidebarState>();
}
