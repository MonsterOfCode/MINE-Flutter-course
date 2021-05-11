import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/business_logic/stores/account/login.store.dart';
import 'package:olx_clone/ui/screen/account/signup.screen.dart';
import 'package:olx_clone/ui/widgets/authentication/authentication_button.widget.dart';
import 'package:olx_clone/ui/widgets/error_box.repository.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
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
                    Text(
                      "Login with email:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                      ),
                    ),
                    Observer(
                      builder: (_) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ErrorBoxWidget(message: store.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            // to reduce the height of the input
                            isDense: true,
                            errorText: store.emailError),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: store.setEmail,
                      );
                    }),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            // to reduce the height of the input
                            isDense: true,
                            errorText: store.passwordError),
                        keyboardType: TextInputType.text,
                        onChanged: store.setPassword,
                      );
                    }),
                    SizedBox(height: 32),
                    Observer(builder: (_) {
                      return AuthenticationButtonWidget(
                        title: "LOGIN",
                        onPressed: store.loginPressed,
                        loading: store.loading,
                      );
                    }),
                    SizedBox(height: 16),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      // Wrap to breack line is necessary
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                            },
                            child: Text(
                              'Cadastre-se',
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
