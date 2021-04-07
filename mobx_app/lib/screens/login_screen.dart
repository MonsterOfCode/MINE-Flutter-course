import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/screens/list_screen.dart';
import 'package:mobx_app/stores/login.store.dart';
import 'package:mobx_app/widgets/custom_icon_button.dart';
import 'package:mobx_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore store;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    store = Provider.of<LoginStore>(context);

    disposer = autorun((_) {
      if (store.loggedIn) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) => CustomTextField(
                        hint: 'Email',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: store.setEmail,
                        enabled: !store.loading,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) => CustomTextField(
                        hint: 'Password',
                        prefix: Icon(Icons.lock),
                        obscure: !store.passwordVisible,
                        onChanged: store.setPassword,
                        enabled: !store.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: store.passwordVisible ? Icons.visibility_off : Icons.visibility,
                          onTap: store.togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (_) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                return states.contains(MaterialState.disabled) ? Theme.of(context).primaryColor.withAlpha(100) : null;
                              }),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                            child: store.loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                            onPressed: store.loginPressed,
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
