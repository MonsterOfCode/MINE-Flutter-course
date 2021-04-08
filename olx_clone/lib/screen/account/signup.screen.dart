import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_clone/widgets/authentication/authentication_button.widget.dart';
import 'package:olx_clone/widgets/authentication/field_title.widget.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FieldTitleWidget(
                    title: "Name",
                    subtitle: "Name that is showed in your abs.",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Dany Mota",
                      // to reduce the height of the input
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  FieldTitleWidget(
                    title: "Email",
                    subtitle: "Your email account",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "test@danymota.com",
                      // to reduce the height of the input
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  SizedBox(height: 16),
                  FieldTitleWidget(
                    title: "Phone",
                    subtitle: "Only to safety reasons.",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "(351) 910 000 000",
                      // to reduce the height of the input
                      isDense: true,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 16),
                  FieldTitleWidget(
                    title: "Password",
                    subtitle: "Use letters, numbers and special characters.",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "teste",
                      // to reduce the height of the input
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  FieldTitleWidget(
                    title: "Confirm Password",
                    subtitle: "Repeat your password.",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "teste",
                      // to reduce the height of the input
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 32),
                  AuthenticationButtonWidget(title: "SIGNUP"),
                  SizedBox(height: 16),
                  Divider(color: Colors.black),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    // Wrap to breack line is necessary
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Already registered? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
