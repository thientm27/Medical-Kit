import 'package:flutter/material.dart';

class Box extends StatelessWidget {

  final String titleString;
  final VoidCallback? onPressedCallback;

  const Box({
    Key? key,
    required this.titleString,
    this.onPressedCallback,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160, 
        height: 100,
        child: ElevatedButton(
                          onPressed: onPressedCallback,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,     
                          ),
                          child: Text(
                            titleString,
                            style:const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              ),                         
                            ),
                        ),
                        );

  }
}