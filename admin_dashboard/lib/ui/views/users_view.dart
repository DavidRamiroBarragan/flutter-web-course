import 'package:admin_dashboard/datatables/users.dart';
import 'package:admin_dashboard/providers/user.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final users = UsersDataSource(userProvider.users);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          "Users view",
          style: CustomLabels.h1(),
        ),
        const SizedBox(
          height: 10,
        ),
        PaginatedDataTable(
            sortAscending: userProvider.ascending,
            sortColumnIndex: userProvider.column,
            columns: [
          const DataColumn(label: Text("Avatar")),
          DataColumn(label: const Text("Nombre"), onSort: (index, _) {
            userProvider.column = index;
            userProvider.sortUsersByColumn((user) => user.nombre);
          }),
          DataColumn(label: const Text('E-mail'), onSort: (index, _) {
            userProvider.column = index;
            userProvider.sortUsersByColumn((user) => user.correo);
          }),
          const DataColumn(label: Text('ID')),
          const DataColumn(label: Text('Acciones'))
        ],
            onPageChanged: (page) {
              print(page);
            },
            source: users)
      ],
    );
  }
}
