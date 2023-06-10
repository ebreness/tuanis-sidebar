import 'package:flutter/material.dart';

class SidebarState extends InheritedWidget {
  /// Whether the sidebar is collapse or not
  ///
  // ignore: prefer_typing_uninitialized_variables
  final isCollapse;

  const SidebarState({super.key, required Widget child, this.isCollapse})
      : super(child: child);

  @override
  bool updateShouldNotify(SidebarState oldWidget) =>
      isCollapse != oldWidget.isCollapse;

  static SidebarState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SidebarState>();
}
