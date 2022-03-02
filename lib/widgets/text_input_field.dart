import 'package:flutter/material.dart';
class TextInputField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPass;
  const TextInputField({Key? key, required this.text, required this.textEditingController, required this.textInputType, this.isPass=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final inputBorder= OutlineInputBorder(
     borderSide: Divider.createBorderSide(context),
   );
    return TextField(
      decoration: InputDecoration(
        hintText: text,
        border:inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8)
      ),
      obscureText: isPass,
      controller:textEditingController ,
      keyboardType: textInputType,
    );
  }
}
