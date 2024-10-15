import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPetInput extends StatelessWidget {
  final Color labelColor;
  final String label;
  final TextInputType? inputType;

  const AddPetInput({
    super.key,
    required this.labelColor,
    required this.label,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: labelColor.withOpacity(0.2),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: labelColor, width: 2),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 2),
              ),
              hintText: label,
              hintStyle: TextStyle(color: labelColor),
            ),
            style: AppStyles.righteous14TextStyle,
            keyboardType: inputType ?? TextInputType.text,
          ),
        ),
        SizedBox(height: 6)
      ],
    );
  }
}
