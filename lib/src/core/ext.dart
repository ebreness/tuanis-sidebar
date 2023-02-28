import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color lighten([double amount = 0.15]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color darken([double amount = 0.15]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

extension ListTileExtensions on ListTile {
  ListTile setDefaults({
    Icon? defaultTrailing,
    EdgeInsetsGeometry? defaultContentPadding,
    GestureTapCallback? defaultOnTap,
    bool defaultSelected = false,
    Color? defaultSelectedColor,
    Color? defaultSelectedTileColor,
    Color? defaultIconColor,
    Color? defaultTextColor,
    Color? defaultFocusColor,
    Color? defaultHoverColor,
    Color? defaultSplashColor,
    Color? defaultTileColor,
  }) {
    return ListTile(
      key: key,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing ?? defaultTrailing,
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity,
      shape: shape,
      style: style,
      selectedColor: selectedColor ?? defaultSelectedColor,
      iconColor: iconColor ?? defaultIconColor,
      textColor: textColor ?? defaultTextColor,
      contentPadding: contentPadding ?? defaultContentPadding,
      enabled: enabled,
      onTap: onTap ?? defaultOnTap,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      mouseCursor: mouseCursor,
      selected: selected || defaultSelected,
      focusColor: focusColor ?? defaultFocusColor,
      hoverColor: hoverColor ?? defaultHoverColor,
      splashColor: splashColor ?? defaultSplashColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tileColor: tileColor ?? defaultTileColor,
      selectedTileColor: selectedTileColor ?? defaultSelectedTileColor,
      enableFeedback: enableFeedback,
      horizontalTitleGap: horizontalTitleGap,
      minLeadingWidth: minLeadingWidth,
      minVerticalPadding: minVerticalPadding,
    );
  }
}
