import 'package:codigo_qr/ui/general/colors.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  Function? onPressed;
  String text;
  CommonButtonWidget({
    required this.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        //Si onPressed es distinto a nulo, caso contrario es nulo.
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: kBrandPrimaryColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14.0,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: kBrandSecundaryColors,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
