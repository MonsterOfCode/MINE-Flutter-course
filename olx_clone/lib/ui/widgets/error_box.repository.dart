import 'package:flutter/material.dart';

class ErrorBoxWidget extends StatelessWidget {
  final String message;

  const ErrorBoxWidget({@required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null)
      return Container();
    else
      return Container(
        color: Colors.red,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(width: 16),
            Expanded(
                child: Text(
              "Oops! $message. Please Try again later.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
          ],
        ),
      );
  }
}
