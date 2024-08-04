import 'package:flutter/material.dart';

class ActionIconUtils {
  static Widget clearInputText({
    required TextEditingController textController,
    required ValueNotifier<String> textNotifier,
    bool showSuffixIconFixed = true,
    Widget? suffixIcon,
    double? sizeIcon,
    VoidCallback? onTap,
  }) {
    return ValueListenableBuilder<String>(
      valueListenable: textNotifier,
      builder: (_, __, ___) {
        textNotifier.value = textController.text;
        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (textController.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    textController.clear();
                    textNotifier.value = '';
                    if (onTap != null) {
                      onTap();
                    }
                  },
                  child: Icon(Icons.close, size: sizeIcon),
                ),
              if (suffixIcon != null &&
                  (showSuffixIconFixed || textController.text.isEmpty))
                suffixIcon,
            ],
          ),
        );
      },
    );
  }

  static Widget passwordInputText({
    required TextEditingController textController,
    required bool isObscureText,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: textController.text.isEmpty
          ? const SizedBox()
          : isObscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
    );
  }
}
