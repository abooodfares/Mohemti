import 'package:flutter/material.dart';
import 'package:mohemti/core/theme/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    
    super.key, required this.controller, this.validator, this.onSaved, required this.labelText, this.icon, this.obscureText,  this.isfilled,
  });
final TextEditingController controller;
final String? Function(String?)? validator;
final void Function(String?)? onSaved;
final String labelText;
final IconData? icon;
final bool? obscureText;
final bool? isfilled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator:validator ,
      controller:controller ,
      onSaved:onSaved,
     textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        labelText:labelText,
        suffixIcon: Icon(icon,color: appcolors.iconscolor,),
        filled: isfilled ?? false,
        fillColor: Colors.white
        
      ),
      
    );
  }
}