import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

/// @author mmunkhsuld

class Input extends StatelessWidget {
  const Input(
      {super.key,
      this.onChanged,
      this.onClear,
      this.onValidate,
      this.onTap,
      this.label,
      this.hint,
      this.length,
      this.inputType,
      this.hideText,
      this.isEnabled,
      this.readOnly,
      this.prefix,
      this.prefixText,
      this.controller,
      this.focusNode,
      this.iconData,
      this.helper,
      this.textLines,
      this.autoFocus});

  final Function? onChanged;
  final Function? onClear;
  final Function? onValidate;
  final Function? onTap;
  final String? label;
  final String? helper;
  final String? hint;
  final int? length;
  final TextInputType? inputType;
  final bool? hideText;
  final bool? isEnabled;
  final bool? readOnly;
  final bool? autoFocus;
  final Widget? prefix;
  final String? prefixText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? iconData;
  final int? textLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label ?? "", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.gray700)) : Container(),
        label != null ? const SizedBox(height: 8) : Container(),
        TextFormField(
          readOnly: readOnly ?? false,
          controller: controller,
          obscureText: hideText ?? false,
          minLines: textLines ?? 1,
          maxLines: textLines ?? 1,
          keyboardType: inputType ?? TextInputType.text,
          autofocus: autoFocus ?? false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(length ?? 255),
          ],
          focusNode: focusNode,
          onTap: onTap != null
              ? () {
                  onTap!();
                }
              : null,
          onChanged: onChanged != null
              ? (text) {
                  onChanged!(text);
                }
              : null,
          validator: onValidate != null
              ? (text) {
                  return onValidate!(text);
                }
              : null,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: isEnabled == false ? AppColors.gray400 : AppColors.gray900),
          decoration: InputDecoration(
              hintText: hint ?? "",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.gray500),
              fillColor: (isEnabled == true || isEnabled == null) ? AppColors.white : AppColors.gray50,
              filled: true,
              enabled: isEnabled ?? true,
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: const BorderSide(color: AppColors.gray300, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: const BorderSide(color: AppColors.gray300, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: const BorderSide(color: AppColors.gray300, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: const BorderSide(color: AppColors.error300, width: 1.0, strokeAlign: BorderSide.strokeAlignOutside),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide:
                    const BorderSide(color: AppColors.primary300, width: 2.0, strokeAlign: BorderSide.strokeAlignInside, style: BorderStyle.solid),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                borderSide: const BorderSide(color: AppColors.error300, width: 2.0, strokeAlign: BorderSide.strokeAlignOutside),
              ),
              errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.error500),
              prefixIcon: prefixText != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 16, top: 14, right: 5),
                      child: Text(
                        prefixText!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : prefix,
              prefixStyle: Theme.of(context).textTheme.bodySmall,
              suffix: onClear != null
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: IconButton(
                        splashRadius: 24,
                        splashColor: Colors.transparent,
                        iconSize: 14,
                        padding: const EdgeInsets.all(0),
                        onPressed: () => onClear!(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    )
                  : null,
              floatingLabelBehavior: FloatingLabelBehavior.never),
        ),
        // helper != null ? Text(helper ?? "", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.gray500)) : Container(),
      ],
    );
  }
}
