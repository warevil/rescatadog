import 'package:rescatadog/profile/data/models.dart';
import 'package:http/http.dart' as http;

class ApiHttpRequest {
  Future<DataProfile?> get dataprofile async {
    final id = 3;
    final http.Response response = await http.get(
        Uri.parse(
            'https://prueba-api-pet.herokuapp.com/api/user/profile/${id}'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      print(response.body);
      return profileFromJson(response.body);
    }
  }
}
