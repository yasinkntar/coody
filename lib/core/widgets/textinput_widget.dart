import 'package:coody/core/utils/colors.dart';
import 'package:coody/core/utils/style.dart';
import 'package:coody/features/auth/presentation/screens/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  TextInput(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.controller,
      this.texterror,
      this.showlabel = true,
      this.ismandatory = false,
      this.isemail = false,
      this.onchanged,
      this.retype,
      this.type = TextInputType.text,
      this.maxline = 1,
      this.maxLength,
      this.maskTextInputFormatter,
      this.isPassword = false});
  String hinttext, labeltext;
  String? texterror, retype;
  bool isPassword, ismandatory, isemail, showlabel;
  TextEditingController controller;
  int maxline;
  int? maxLength;
  TextInputType type;
  MaskTextInputFormatter? maskTextInputFormatter;
  String? Function(String?)? onchanged;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isvisble = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showlabel
            ? Text(
                widget.labeltext,
                style: getbodyStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff31343d)),
              )
            : const SizedBox(),
        widget.showlabel ? const Gap(10) : const SizedBox(),
        TextFormField(
          inputFormatters: widget.maskTextInputFormatter == null
              ? []
              : [widget.maskTextInputFormatter!],
          maxLines: widget.maxline,
          maxLength: widget.maxLength,
          keyboardType: widget.type,
          controller: widget.controller,
          enableInteractiveSelection: false,
          obscureText: widget.isPassword ? isvisble : false,
          validator: (value) {
            if (widget.ismandatory) {
              if (value!.isEmpty) {
                return 'Please enter ${widget.labeltext}';
              }
            }
            if (widget.isemail) {
              if (!emailValidate(value!)) {
                return 'Invalid email';
              }
            }
            if (widget.retype != null) {
              if (widget.controller.text == widget.retype) {
                return 'Passwords do not match';
              }
            }

            return null;
          },
          style: getbodyStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff32343e)),
          decoration: InputDecoration(
            errorText: widget.texterror,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isvisble = !isvisble;
                      });
                    },
                    icon: isvisble
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))
                : null,
            hintText: widget.hinttext,
            fillColor: AppColors.textinputColor,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(19, 23, 19, 22),
            hintStyle: getbodyStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xff6B6E82)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textinputColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textinputColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textinputColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textinputColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const Gap(15)
      ],
    );
  }
}
