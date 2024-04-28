import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

/// @author mmunkhsuld

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  final Widget? widgetTitle;

  final Function? leadingPressed;

  final Widget? actionWidget;

  final double? height;

  final bool? hideLeadingBtn;

  final Color? background;

  final double? elevation;

  CustomAppBar(
      {super.key,
      this.title,
      this.leadingPressed,
      this.actionWidget,
      this.widgetTitle,
      this.height,
      this.hideLeadingBtn,
      this.background,
      this.elevation})
      : preferredSize = Size.fromHeight(height ?? 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widgetTitle ?? Text(title ?? '', maxLines: 1, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.gray500)),
      centerTitle: widgetTitle != null ? false : true,
      backgroundColor: background ?? Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarColor: background ?? Colors.transparent),
      elevation: elevation ?? 0,
      automaticallyImplyLeading: true,
      surfaceTintColor: Colors.transparent,
      leadingWidth: (hideLeadingBtn == true) ? 0 : 50,
      leading: (hideLeadingBtn == null || hideLeadingBtn == false)
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: AppColors.gray200,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.gray500,
              ),
              onPressed: () {
                if (leadingPressed != null) {
                  leadingPressed!();
                } else {
                  if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
                    FocusScope.of(context).unfocus();
                    Timer(const Duration(milliseconds: 250), () {
                      Navigator.maybePop(context);
                    });
                  } else {
                    Navigator.maybePop(context);
                  }
                }
              },
            )
          : Container(),
      actions: [
        actionWidget != null
            ? Container(
                margin: const EdgeInsets.only(right: 8),
                child: actionWidget,
              )
            : Container()
      ],
    );
  }
}
