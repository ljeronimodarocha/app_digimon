import 'package:http/http.dart' as http;

import 'package:app_digimon/src/shared/cliente_http.dart';
import 'package:http/http.dart';

class ClienteHttpImp extends ClienteHttp {
  @override
  Future<Response> getUrl(String url) async {
    return await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 15),
        );
  }
}
