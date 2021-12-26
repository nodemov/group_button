import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.image,
    required this.isSelected,
    this.selectedBorderColor,
    required this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    required this.unselectedColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
    required this.textAlign,
    required this.textPadding,
    this.alignment,
    this.elevation,
  }) : super(key: key);

  final String text;
  final String image;
  final void Function()? onPressed;
  final bool isSelected;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final EdgeInsets textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;

  bool get isEnabled => onPressed != null;

  List<BoxShadow>? get _boxShadow => isSelected
      ? selectedShadow
      : isEnabled
          ? unselectedShadow
          : null;

  TextStyle? get _textStyle => isSelected
      ? selectedTextStyle
      : isEnabled
          ? unselectedTextStyle
          : null;

  Color? get _borderColor => isSelected
      ? selectedBorderColor ?? unselectedBorderColor
      : isEnabled
          ? unselectedBorderColor
          : null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: _boxShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF007468),
          ),
          elevation: 0.0,
          primary: isSelected ? Color(0xFF007468) : Color(0xFFFFFFFF),
          minimumSize: Size.zero, // <-- Add this
          padding: EdgeInsets.zero, // <-- and this
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '    $text',
                style: isSelected ? selectedTextStyle : unselectedTextStyle,
              ),
                Image.network(
                image,
                fit: BoxFit.cover,
                width: 145,
                height: 49,
              ),
            ]),
      ),
    );
  }

  Color? _getBackGroundColor(ThemeData theme) {
    final themePrimaryColor = theme.buttonTheme.colorScheme?.primary;
    //TODO: implement
    // final themeSecondaryColor = theme.buttonTheme.colorScheme?.secondary;

    Color? selectedColorBuffer = selectedColor;
    Color? unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    selectedColorBuffer ??= Colors.black;

    unselectedColorBuffer ??= Colors.white;

    final color = isSelected
        ? selectedColorBuffer
        : isEnabled
            ? unselectedColorBuffer
            : null;
    return color;
  }

  OutlinedBorder? _buildShape() {
    final color = _borderColor;
    if (borderRadius != null) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius!,
        side: buildBorderSide(color),
      );
    } else {
      return RoundedRectangleBorder(
        side: buildBorderSide(color),
      );
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(
        color: color,
      );
    }
    return BorderSide.none;
  }
}
