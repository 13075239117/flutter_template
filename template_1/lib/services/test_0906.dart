import 'package:template_1/services/request.dart';

void main(List<String> args) async {
  var dio = DioRequest().dio;
  var res = await dio.get('https://picsum.photos/300/300?random=1');
  print(res);
}
