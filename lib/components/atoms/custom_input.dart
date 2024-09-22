part of 'index.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    required this.controller,
    required this.nameLabel,
    this.hintText,
    this.enabled = true,
    this.obscureText = false,
    this.readOnly = false,
    this.hasBoldNameLabel = false,
    this.autoFocus = false,
    this.showIconClear = true,
    this.showCounter = false,
    this.showEdit = false,
    this.showSuffixIconFixed = true,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.isValid,
    this.descriptiveText,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onClear,
    this.onTapEdit,
    this.autovalidateMode,
    this.disabledLabelColor,
    this.disabledInputColor,
    this.disabledFilledColor,
    this.enableInteractiveSelection = true,
    this.keyButtonEdit,
    super.key,
  });
  final TextEditingController controller;
  final String nameLabel;
  final String? hintText;
  final bool enabled;
  final bool obscureText;
  final bool readOnly;
  final bool hasBoldNameLabel;
  final bool autoFocus;
  final bool showIconClear;
  final bool showCounter;
  final bool showEdit;
  final bool showSuffixIconFixed;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isValid;
  final String? descriptiveText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final Color? disabledLabelColor;
  final Color? disabledInputColor;
  final Color? disabledFilledColor;
  final VoidCallback? onClear;
  final VoidCallback? onTapEdit;
  final AutovalidateMode? autovalidateMode;
  final bool enableInteractiveSelection;
  final Key? keyButtonEdit;
  @override
  State<CustomInput> createState() => CustomInputWidgetState();
}

class CustomInputWidgetState extends State<CustomInput> {
  @visibleForTesting
  late FocusNode focusNode;
  @visibleForTesting
  final ValueNotifier<bool> hasFocusNotifier = ValueNotifier<bool>(false);
  @visibleForTesting
  final ValueNotifier<String> textNotifier = ValueNotifier<String>('');

  final ToggleValueModel toggleValueModel = ToggleValueModel(false);

  @override
  void initState() {
    super.initState();
    textNotifier.value = widget.controller.text;
    toggleValueModel.value = widget.obscureText;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      hasFocusNotifier.value = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(() {});
    hasFocusNotifier.dispose();
    textNotifier.dispose();
  }

  bool _isValid() {
    return widget.isValid == null || widget.isValid!;
  }

  Color _getColorBorder({required bool hasFocus}) {
    if (hasFocus && _isValid()) {
      return MaterialTheme.lightScheme().onSurface;
    } else if (!_isValid()) {
      return MaterialTheme.lightScheme().error;
    }
    return Colors.transparent;
  }

  Color _getColorFilled({required bool hasFocus}) {
    if (hasFocus) {
      return MaterialTheme.lightScheme().surfaceContainer;
    }
    return widget.disabledFilledColor ?? MaterialTheme.lightScheme().surfaceContainer;
  }

  Color _getColorText() {
    if (!_isValid() && widget.enabled) {
      return MaterialTheme.lightScheme().error;
    } else if (widget.enabled) {
      return MaterialTheme.lightScheme().onSurface;
    }
    return widget.disabledLabelColor ??
        MaterialTheme.lightScheme().onSurfaceVariant;
  }

  Color _getColorIcon() {
    if (widget.enabled) {
      return MaterialTheme.lightScheme().onSurface;
    }
    return MaterialTheme.lightScheme().onSurfaceVariant;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.nameLabel.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: SpacingTheme.xs),
            child: Text(
              widget.nameLabel,
              style: TextStyle(
                fontSize: 14,
                color: _getColorText(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Row(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder<bool>(
                valueListenable: hasFocusNotifier,
                builder: (_, __, ___) {
                  return InkWell(
                    child: TextFormField(
                      key: widget.key,
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap!();
                        }
                      },
                      onChanged: (String? value) {
                        textNotifier.value = value!;
                        if (widget.onChanged != null) {
                          widget.onChanged!.call(value);
                        }
                      },
                      readOnly: widget.readOnly,
                      onFieldSubmitted: (String value) {
                        if (widget.onFieldSubmitted != null) {
                          widget.onFieldSubmitted!;
                        }
                      },
                      autovalidateMode: widget.autovalidateMode,
                      onSaved: widget.onSaved,
                      validator: widget.validator,
                      controller: widget.controller,
                      focusNode: focusNode,
                      enabled: widget.enabled,
                      autofocus: widget.autoFocus,
                      keyboardType: widget.keyboardType,
                      inputFormatters: widget.inputFormatters,
                      enableInteractiveSelection:
                          widget.enableInteractiveSelection,
                      textInputAction: TextInputAction.done,
                      textCapitalization: widget.textCapitalization,
                      obscureText: toggleValueModel.value,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.enabled
                            ? MaterialTheme.lightScheme().onSurface
                            : MaterialTheme.lightScheme().onSurfaceVariant,
                      ),
                      cursorColor: MaterialTheme.lightScheme().onSurface,
                      cursorWidth: 1,
                      cursorHeight: 17,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: !widget.enabled
                              ? MaterialTheme.lightScheme().onSurfaceVariant
                              : hasFocusNotifier.value
                                  ? MaterialTheme.lightScheme().onSurfaceVariant
                                  : MaterialTheme.lightScheme()
                                      .onSurfaceVariant,
                        ),
                        errorStyle: const TextStyle(height: 0),
                        counterText: widget.showCounter
                            ? '${widget.controller.text.length}/${widget.maxLength}'
                            : '',
                        filled: true,
                        fillColor: _getColorFilled(
                          hasFocus: hasFocusNotifier.value,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: SpacingTheme.s,
                          horizontal: 14,
                        ),
                        prefixIcon: widget.prefixIcon,
                        prefixIconColor: _getColorIcon(),
                        suffixIcon: widget.obscureText
                            ? ActionIconUtils.passwordInputText(
                                textController: widget.controller,
                                isObscureText: toggleValueModel.value,
                                onTap: () {
                                  toggleValueModel.value =
                                      !toggleValueModel.value;
                                  setState(() {});
                                },
                              )
                            : hasFocusNotifier.value && widget.showIconClear
                                ? ActionIconUtils.clearInputText(
                                    textController: widget.controller,
                                    textNotifier: textNotifier,
                                    suffixIcon: widget.suffixIcon,
                                    showSuffixIconFixed:
                                        widget.showSuffixIconFixed,
                                    onTap: widget.onClear,
                                  )
                                : widget.suffixIcon,
                        suffixIconColor: _getColorIcon(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _getColorBorder(
                              hasFocus: hasFocusNotifier.value,
                            ),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _getColorBorder(
                              hasFocus: hasFocusNotifier.value,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _getColorBorder(
                              hasFocus: hasFocusNotifier.value,
                            ),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _getColorBorder(
                              hasFocus: hasFocusNotifier.value,
                            ),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MaterialTheme.lightScheme().outlineVariant,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        if (widget.descriptiveText != null &&
            widget.descriptiveText!.isNotEmpty)
          Row(
            children: <Widget>[
              if (widget.isValid != null &&
                  !widget.isValid! &&
                  widget.enabled &&
                  widget.nameLabel.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 4, top: 4),
                  child: Icon(
                    Icons.info,
                    size: 16,
                    color: MaterialTheme.lightScheme().error,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    widget.descriptiveText ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: _getColorText(),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
