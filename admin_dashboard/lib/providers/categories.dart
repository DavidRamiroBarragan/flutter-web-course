import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');

    categories = CategoriesResponse.fromMap(response).categorias;

    notifyListeners();
  }
  
  Future newCategory(String name)async{
    final data = {
      'nombre': name,
    };
    
    try{
      final request = await CafeApi.httpPost('/categorias', data);
      categories.add(Category.fromMap(request));
      notifyListeners();
      return Category.fromMap(request);
    }catch(e){
      throw 'Error al crear la categoría';
    }
  }

  Future updateCategory(String id, String name) async{
    try{
      final request = await CafeApi.httpPut('/categorias/${id}', {"nombre": name});
      categories = categories.map((c){
        if(c.id != id){
          return c;
        }
        c.nombre = name;
        return c;
      }).toList();

      notifyListeners();
      return Category.fromMap(request);
    } catch(e){
      throw 'Error en la actualización';
    }
  }

  Future deleteCategory(String id) async {
    try{
      final request = await CafeApi.httpDelete('/categorias/${id}');
      categories.removeWhere((category) => category.id == id);

      notifyListeners();
    } catch(e){
      print('Error en la actualización');
    }
  }
}
