import 'package:http/http.dart' as http;
import 'package:paquetes/clases/rqres_respuesta.dart';

void getReqRest_service(){
  final Uri url = Uri.parse('https://reqres.in/api/users?page=2');
  http.get(url).then((response) {
    final reqResponse = reqresRespuestaFromJson(response.body);
    print(reqResponse);
  });
}