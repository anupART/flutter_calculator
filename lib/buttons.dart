import

'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final buttonTapped;

  // Use a larger font size for numbers
  final double fontSize;

  MyButton({
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
    this.fontSize = 20.0, // Default font size
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: isNumeric() ? fontSize : null,
                  fontWeight: isNumeric() ? FontWeight.bold : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to check if the button represents a numeric value
  bool isNumeric() {
    return double.tryParse(buttonText) != null;
  }
}