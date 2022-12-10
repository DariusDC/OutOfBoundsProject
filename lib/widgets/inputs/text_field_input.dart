import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_dimens.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({
    Key? key,
    this.label,
    this.error = "",
    this.hint = "",
    this.controller,
    this.textSize = AppDimens.defaultTextInputSize,
    this.keyboardType,
    this.textInputAction,
    this.textInputKey,
    this.obscureText = false,
    this.focusNode,
  }) : super(key: key);

  factory TextFieldInput.link({
    Key? textInputKey,
    String? label,
    String error = "",
    TextEditingController? controller,
    TextInputAction? textInputAction,
  }) {
    return TextFieldInput(
      textInputKey: textInputKey,
      controller: controller,
      error: error,
      hint: "https:",
      label: label,
      textInputAction: textInputAction,
      keyboardType: TextInputType.url,
    );
  }

  factory TextFieldInput.big({
    String label = "",
    String error = "",
    String hint = "",
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Key? textInputKey,
  }) {
    return TextFieldInput(
      textInputKey: textInputKey,
      textSize: AppDimens.largeTextInputSize,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      error: error,
      hint: hint,
      label: label,
    );
  }

  factory TextFieldInput.password({
    String label = "",
    String error = "",
    String hint = "",
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Key? textInputKey,
  }) {
    return TextFieldInput(
      textInputKey: textInputKey,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      error: error,
      hint: hint,
      label: label,
      obscureText: true,
    );
  }

  final bool obscureText;
  final Key? textInputKey;
  final String? label;
  final String error;
  final String hint;
  final TextEditingController? controller;
  final double? textSize;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late TextEditingController _controller;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    _controller = widget.controller ?? TextEditingController(text: "");
    if (widget.obscureText) {
      _controller.addListener(_checkPassword);
    }
  }

  @override
  void dispose() {
    if (widget.obscureText) {
      _controller.removeListener(_checkPassword);
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _checkPassword() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: AppTextStyles.mediumRegularPoppins,
          ),
        TextField(
          obscureText: _obscureText,
          obscuringCharacter: "*",
          key: widget.textInputKey,
          controller: _controller,
          focusNode: widget.focusNode,
          inputFormatters: ([
            TextInputType.phone,
            TextInputType.number,
          ].contains(widget.keyboardType))
              ? [FilteringTextInputFormatter.allow(RegExp(r'[+ \-0-9]'))]
              : TextInputType.visiblePassword == widget.keyboardType
                  ? [FilteringTextInputFormatter.deny(' ')]
                  : [],
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? _controller.text != ""
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                            bottom: AppDimens.xxxxSPadding,
                          ),
                          child: Icon(Icons.remove_red_eye),
                        ),
                      )
                    : null
                : null,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.yellow,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black,
              ),
            ),
            contentPadding: const EdgeInsets.only(
              bottom: AppDimens.xxxSPadding,
            ),
            isDense: true,
            hintText: widget.hint,
            hintStyle: AppTextStyles.largeBoldPoppins.copyWith(
              color: AppColors.darkGray,
              fontSize: widget.textSize,
            ),
            errorText: widget.error.isNotEmpty ? widget.error : null,
            errorStyle: AppTextStyles.x3SRegularPoppins.copyWith(
              color: AppColors.red,
              height: AppDimens.xxxxxSPadding,
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.red,
              ),
            ),
          ),
          style: AppTextStyles.largeBoldPoppins.copyWith(
            color: AppColors.black,
            fontSize: widget.textSize,
          ),
        ),
      ],
    );
  }
}
