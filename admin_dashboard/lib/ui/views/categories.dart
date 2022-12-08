import 'package:admin_dashboard/datatables/categories.dart';
import 'package:admin_dashboard/providers/categories.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        Text(
          "Categorías",
          style: CustomLabels.h1(),
        ),
        const SizedBox(
          height: 10,
        ),
        PaginatedDataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Categoría')),
            DataColumn(label: Text('Creado por')),
            DataColumn(label: Text('Acciones'))
          ],
          source: CategoriesDataTableSource(categories, context),
          header: const Text(
            "Listado de Categorías",
            maxLines: 2,
          ),
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage = value ?? 10;
            });
          },
          rowsPerPage: _rowsPerPage,
          actions: [
            CustomIconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                    context: context, builder: (_) => const CategoryModal());
              },
              text: "Crear",
              icon: Icons.add_outlined,
            )
          ],
        )
      ],
    );
  }
}
