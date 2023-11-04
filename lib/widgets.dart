
import 'package:flutter/material.dart';


Widget buildSlide(String text, String buttonText, String imagePath,Color buttonColor) {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        // Right side (text and button)
        Expanded(
          flex: 3, // Adjust the flex value as needed
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Left side (image)
        Expanded(
          flex: 2, // Adjust the flex value as needed
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 200.0,
          ),
        ),
      ],
    ),
  );
}
