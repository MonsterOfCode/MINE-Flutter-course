import 'package:flutter/material.dart';

class AuthenticationButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  bool loading;
  AuthenticationButtonWidget({Key key, @required this.title, @required this.onPressed, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled) ? Colors.orange.withAlpha(120) : Colors.orange;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Text("$title"),
        onPressed: onPressed,
      ),
    );
  }
}
