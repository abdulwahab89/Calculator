import 'main.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var x = '';
  Color color;
  final VoidCallback onPress;
  MyButton({
    Key? key,
    this.color = const Color(0xffa5a5a5),
    this.x = '',
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                x,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
