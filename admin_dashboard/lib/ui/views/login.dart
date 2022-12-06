import 'package:admin_dashboard/providers/auth.dart';
import 'package:admin_dashboard/providers/login_form.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlinebutton.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (context) {
        return LoginFormProvider();
      },
      child: Builder(
        builder: (context) {
          final loginProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 370),
                  child: Form(
                    key: loginProvider.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return 'Email no válido';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            loginProvider.email = value;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Email',
                              icon: Icons.email_outlined),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            loginProvider.password = value;
                          },
                          onFieldSubmitted: (value) {
                            submit(loginProvider, authProvider);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe de tener al menos 6 caracteres';
                            }

                            return null;
                          },
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su password',
                              label: 'Password',
                              icon: Icons.password_outlined),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlineButton(
                          onPressed: () {
                            submit(loginProvider, authProvider);
                          },
                          text: "Ingresar",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkText(
                            text: "Nueva cuenta",
                            onPress: () => Navigator.pushNamed(
                                context, Flurorouter.registerRouter))
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  void submit(LoginFormProvider loginProvider, AuthProvider authProvider){
    final isValid = loginProvider.validateForm();

    if (isValid) {}
    authProvider.login(
        loginProvider.email, loginProvider.password);
  }
}
