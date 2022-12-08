import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories.dart';
import 'package:admin_dashboard/services/notifications.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlinebutton.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Category? category;

  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0xff0F2041),
          boxShadow: [BoxShadow(color: Colors.black26)]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category?.nombre ?? "Nueva Categoría",
                style: CustomLabels.h1().copyWith(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) {
              name = value;
            },
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la categorías',
                label: 'Categoría',
                icon: Icons.new_releases_outlined),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlineButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    await categoriesProvider.newCategory(name);
                    NotificationsService.showSnackBarSuccess(
                        "La categoría se creó con éxito");
                  } else {
                    await categoriesProvider.updateCategory(id!, name);
                    NotificationsService.showSnackBarSuccess(
                        "La categoría se actualizó con éxito");
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackBarError(e.toString());
                }
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
