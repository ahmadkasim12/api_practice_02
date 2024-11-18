import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  const MyTextButton({super.key, required this.text, required this.onTap, required this.isLoading});

  TextButtonThemeData get white {
    return TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.white12),
              )
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white12),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
        data: this.white,
        child: TextButton(
          onPressed: onTap,
          child: Center(
            child: isLoading ? SizedBox(width: 13, height: 13, child: CircularProgressIndicator(color: Colors.white60)) : Text(text, style: TextStyle(color: Colors.white),),
          ),
        )
    );
  }
}
