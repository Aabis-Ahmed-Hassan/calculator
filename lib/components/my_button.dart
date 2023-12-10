import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String title;
  final Color buttonBackgroundColor;
  final VoidCallback onPress;
  const MyButton({super.key ,
    required this.title ,
    this.buttonBackgroundColor = const Color(0xffa5a5a5),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                color:buttonBackgroundColor,
                shape:BoxShape.circle,
              ),

              child: Center(
                child: Text(title , style: TextStyle(color: Colors.white , fontSize: 22),),
              )

          ),
        ),
      ),
    );
  }
}
