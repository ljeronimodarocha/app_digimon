import 'package:http/http.dart';

abstract class ClienteHttp {
  Future<Response> getUrl(String url);
}
