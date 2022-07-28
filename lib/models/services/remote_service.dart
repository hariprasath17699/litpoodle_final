import 'package:http/http.dart' as http;
import 'package:litpoodle/components/domain_url.dart';
import 'package:litpoodle/models/recommended_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var headers = {'Cookie': 'ci_session=bncvcjfehtbpne236kfqm3e9up0c6tej'};
    var request = http.Request('GET', Uri.parse('$domain_url/api/search/home'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
