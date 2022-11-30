import 'package:admin_dashboard/providers/register_form.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlinebutton.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerProvider = Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 370),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value != null && value.isEmpty){
                              return "El nombre es obligatorio";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            registerProvider.name = value;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.verified_user_outlined),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if(EmailValidator.validate(value!)){
                              return 'Email no válido';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            registerProvider.email = value;
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
                            registerProvider.password = value;
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
                          onPressed: () {},
                          text: "Crear cuenta",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkText(
                            text: "Login",
                            onPress: () =>
                                Navigator.pushNamed(context, Flurorouter.loginRouter))
                      ],
                    ),
                  ),
                ),
              ));
        }
      ),
    );
  }
}
