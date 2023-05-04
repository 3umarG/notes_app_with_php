import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.hint, required this.icon})
      : super(key: key);

  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextFormField(

        validator: (value){
          if(value == null || value.isEmpty){
            return "$hint shouldn't be empty";
          }else {
          return null;
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.deepPurple,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
