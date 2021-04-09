import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/business_logic/stores/account/signup.store.dart';
import 'package:olx_clone/ui/widgets/authentication/authentication_button.widget.dart';
import 'package:olx_clone/ui/widgets/authentication/field_title.widget.dart';
import 'package:olx_clone/ui/widgets/error_box.repository.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore store = SignupStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
                    Observer(
                        builder: (_) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ErrorBoxRepository(message: store.error),
                            )),
                    FieldTitleWidget(
                      title: "Name",
                      subtitle: "Name that is showed in your abs.",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Dany Mota",
                          // to reduce the height of the input
                          isDense: true,
                          errorText: store.nameError,
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: store.setName,
                      );
                    }),
                    SizedBox(height: 16),
                    FieldTitleWidget(
                      title: "Email",
                      subtitle: "Your email account",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "test@danymota.com",
                          // to reduce the height of the input
                          isDense: true,
                          errorText: store.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: store.setEmail,
                      );
                    }),
                    SizedBox(height: 16),
                    FieldTitleWidget(
                      title: "Phone",
                      subtitle: "Only to safety reasons.",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "(351) 910 000 000",
                            // to reduce the height of the input
                            isDense: true,
                            errorText: store.phoneError),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: store.setPhone,
                      );
                    }),
                    SizedBox(height: 16),
                    FieldTitleWidget(
                      title: "Password",
                      subtitle: "Use letters, numbers and special characters.",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          // to reduce the height of the input
                          isDense: true,
                          errorText: store.passwordError,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: store.setPassword,
                      );
                    }),
                    SizedBox(height: 16),
                    FieldTitleWidget(
                      title: "Confirm Password",
                      subtitle: "Repeat your password.",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            // to reduce the height of the input
                            isDense: true,
                            errorText: store.password2Error),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: store.setPassword2,
                      );
                    }),
                    SizedBox(height: 32),
                    Observer(builder: (_) {
                      return AuthenticationButtonWidget(
                        title: "SIGNUP",
                        onPressed: store.signupPressed,
                        loading: store.loading,
                      );
                    }),
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
      ),
    );
  }
}
