import 'package:rescatadog/profile/class/pedido.dart';
import 'package:http/http.dart' as http;

class ApiHttpRequest {
  Future<DataProfile?> get dataprofile async {
    final id = 2;
    final http.Response response = await http.get(
        Uri.parse(
            'https://prueba-api-pet.herokuapp.com/api/prueba/profile/${id}'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      print(response.body);
      return profileFromJson(response.body);
    }
  }
}
