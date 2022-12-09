import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/user.dart';
import 'package:admin_dashboard/services/notifications.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
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

    usersProvider.getUserByIdi(widget.uid).then((userDB) {
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
              child: Container(
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
    return Container(
      child: Table(
        columnWidths: const {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            WhiteCard(
                child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Profile', style: CustomLabels.h2()),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 160,
                      child: Stack(
                        children: [
                          const ClipOval(
                            child: Image(
                              image: AssetImage('no-image.jpg'),
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
                                  border: Border.all(
                                      color: Colors.white, width: 5)),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Nombre de usuario',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
            )),
            Container()
          ])
        ],
      ),
    );
  }
}
