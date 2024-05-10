import 'package:flutter/material.dart';

import '../constants/colors.dart';

enum _Type { gray }

abstract final class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool isGreen;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  final _Type type;

  const CustomFilledButton({
    required this.type,
    required this.onPressed,
    required this.child,
    this.isGreen = false,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.statesController,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  }); //tran

  const factory CustomFilledButton.orange({
    required void Function()? onPressed,
    required Widget child,
    bool isGreen,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    MaterialStatesController? statesController,
  }) = _OrangeButton;

  // const factory CustomDialog.success({
}

final class _OrangeButton extends CustomFilledButton {
  const _OrangeButton({
    super.onPressed,
    required super.child,
    super.isGreen = false,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.statesController,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
  }) : super(type: _Type.gray);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        //4 radius
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return darkBlue;
            } else {
              return const Color(0xFFEF6B4A);
            }
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (states) => BorderSide.none,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return gray;
            } else {
              return const Color(0xFFEF6B4A);
            }
          },
        ),
      ),
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
    );
  }
}
