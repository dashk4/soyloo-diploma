import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

/// @author mmunkhsuld

enum ButtonType { primary, secondary, bordered, warning, transparent }

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.onPressed,
      required this.buttonType,
      this.text,
      this.iconPath,
      this.isLoading,
      this.height,
      this.elevation,
      this.textColor,
      this.child,
      this.background,
      this.borderColor});

  final Function? onPressed;
  final String? text;
  final ButtonType buttonType;
  final String? iconPath;
  final bool? isLoading;
  final double? height;
  final double? elevation;
  final Color? textColor;
  final Widget? child;
  final Color? background;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    Color mColor, mTextColor, mDisabledColor, mDisabledTextColor, mHighlightColor;
    RoundedRectangleBorder mBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
    );
    if (buttonType == ButtonType.secondary) {
      mColor = AppColors.primary100;
      mHighlightColor = AppColors.primary200;
      mTextColor = AppColors.primary700;
      mDisabledColor = AppColors.primary50;
      mDisabledTextColor = AppColors.primary200;
    } else if (buttonType == ButtonType.bordered) {
      mColor = AppColors.white;
      mHighlightColor = AppColors.gray200;
      mTextColor = AppColors.gray700;
      mDisabledColor = AppColors.gray100;
      mDisabledTextColor = AppColors.gray300;
      mBorder = mBorder.copyWith(side: BorderSide(color: onPressed != null ? AppColors.gray300 : AppColors.gray100, width: 1.5));
    } else if (buttonType == ButtonType.transparent) {
      mColor = Colors.transparent;
      mHighlightColor = Colors.transparent.withOpacity(0.1);
      mTextColor = textColor ?? AppColors.primary600;
      mDisabledColor = Colors.transparent;
      mDisabledTextColor = AppColors.primary300;
    } else if (buttonType == ButtonType.warning) {
      mColor = AppColors.error500;
      mHighlightColor = AppColors.error700;
      mTextColor = AppColors.white;
      mDisabledColor = AppColors.error50;
      mDisabledTextColor = AppColors.error200;
    } else {
      mColor = AppColors.primary600;
      mHighlightColor = AppColors.primary800;
      mTextColor = AppColors.white;
      mDisabledColor = AppColors.primary300;
      mDisabledTextColor = AppColors.white;
    }
    if (borderColor != null) {
      mBorder = mBorder.copyWith(side: BorderSide(color: onPressed != null ? borderColor ?? AppColors.gray300 : AppColors.gray100, width: 1.5));
    }

    TextStyle mTextStyle;

    if (MediaQuery.sizeOf(context).width > 430) {
      mTextStyle = buttonType == ButtonType.transparent
          ? Theme.of(context).textTheme.titleSmall!.copyWith(color: onPressed != null ? mTextColor : mDisabledTextColor, fontWeight: FontWeight.w400)
          : Theme.of(context).textTheme.bodyMedium!.copyWith(color: onPressed != null ? mTextColor : mDisabledTextColor);
    } else {
      mTextStyle = buttonType == ButtonType.transparent
          ? Theme.of(context).textTheme.labelSmall!.copyWith(color: onPressed != null ? mTextColor : mDisabledTextColor, fontWeight: FontWeight.w400)
          : Theme.of(context).textTheme.bodySmall!.copyWith(color: onPressed != null ? mTextColor : mDisabledTextColor);
    }

    return MaterialButton(
      color: background ?? mColor,
      disabledColor: mDisabledColor,
      splashColor: Colors.transparent,
      elevation: elevation ?? 0,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      highlightColor: mHighlightColor,
      hoverColor: mHighlightColor,
      focusColor: mHighlightColor,
      highlightElevation: 0,
      height: height ?? (MediaQuery.sizeOf(context).width > 375 ? AppSizes.buttonHeight : 54),
      shape: mBorder,
      clipBehavior: Clip.hardEdge,
      animationDuration: const Duration(milliseconds: 250),
      onPressed: (isLoading == null || isLoading == false) && onPressed != null ? () => onPressed!() : null,
      child: child ??
          ((iconPath != null && text == "")
              ? SvgPicture.asset(
                  "assets/${iconPath!}",
                  width: 20,
                  colorFilter: ColorFilter.mode(onPressed != null ? mTextColor : mDisabledTextColor, BlendMode.srcIn),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconPath != null && (isLoading == null || isLoading == false))
                      SvgPicture.asset(
                        "assets/${iconPath!}",
                        width: 22,
                        height: 22,
                        colorFilter: ColorFilter.mode(onPressed != null ? mTextColor : mDisabledTextColor, BlendMode.srcIn),
                      ),
                    (isLoading == null || isLoading == false)
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: iconPath != null ? 6 : 0),
                            child: Text(
                              text ?? "",
                              style: mTextStyle,
                            ),
                          )
                        : SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: mTextColor,
                              strokeWidth: 2,
                            ),
                          )
                  ],
                )),
    );
  }
}
