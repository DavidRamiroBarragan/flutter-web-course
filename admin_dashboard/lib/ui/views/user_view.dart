import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/user.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/services/notifications.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UserProvider>(context, listen: false);
    final usersFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserByIdi(widget.uid).then((userDB) {
      usersFormProvider.user = userDB;
      setState(() {
        user = userDB;
      });
    }).catchError((e) {
      NotificationsService.showSnackBarError('Error en la petición');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          "User view",
          style: CustomLabels.h1(),
        ),
        const SizedBox(
          height: 10,
        ),
        if (user == null)
          WhiteCard(
              child: SizedBox(
            height: 400,
            child: const CircularProgressIndicator(),
          )),
        if (user != null) const _UserView()
      ],
    );
  }
}

class _UserView extends StatelessWidget {
  const _UserView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    return Table(
      columnWidths: const {0: FixedColumnWidth(250)},
      children: [
        TableRow(children: [
          WhiteCard(
              child: Container(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Profile', style: CustomLabels.h2()),
                  const SizedBox(
                    height: 20,
                  ),
                  const _Avatar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    userFormProvider.user!.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          )),
          _UserForm()
        ])
      ],
    );
  }
}

class _UserForm extends StatelessWidget {
  const _UserForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    return WhiteCard(
        title: 'Información del usuario',
        child: Form(
            key: userFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: userFormProvider.user!.nombre,
                  onChanged: (value) {
                    userFormProvider.copyUserWith(nombre: value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un nombre';
                    }

                    if (value.length < 3) {
                      return 'El nombre no es válido';
                    }

                    return null;
                  },
                  decoration: CustomInputs.loginInputDecoration(
                      hint: 'Nombre del usuario',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: userFormProvider.user!.correo,
                  onChanged: (value) {
                    userFormProvider.copyUserWith(correo: value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un correo';
                    }
                    if (!EmailValidator.validate(value!)) {
                      return 'Email no válido';
                    }

                    return null;
                  },
                  decoration: CustomInputs.loginInputDecoration(
                      hint: 'E-mail del usuario',
                      label: 'Correo',
                      icon: Icons.mark_email_read_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 110),
                  child: ElevatedButton(
                      onPressed: () {
                        userFormProvider
                            .updateUser()
                            .then((value) => (value) {
                                  Provider.of<UserProvider>(context)
                                      .refreshUsers(userFormProvider.user!);
                                  NotificationsService.showSnackBarSuccess(
                                      'Usuario Actualizado');
                                })
                            .catchError((_) {
                          NotificationsService.showSnackBarError(
                              'Error en la actualización');
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.save_outlined,
                            size: 20,
                          ),
                          Text('Guardar')
                        ],
                      )),
                )
              ],
            )));
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    return SizedBox(
      width: 150,
      height: 160,
      child: Stack(
        children: [
          ClipOval(
            child: Image(
              image: AssetImage(userFormProvider.user!.img ?? 'no-image.jpg'),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 5)),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.indigo,
                elevation: 0,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
