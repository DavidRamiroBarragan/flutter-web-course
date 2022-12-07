import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDataTableSource(this.categories, this.context);


  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categories[index].id)),
      DataCell(Text(categories[index].nombre)),
      DataCell(Text(categories[index].usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text("Estás seguro"),
                  content: Text('Borrar definitivamente ${categories[index].nombre}'),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop;
                    }, child: const Text("No")),
                    TextButton(onPressed: (){}, child: const Text("Sí, borrar")),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              )),
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
