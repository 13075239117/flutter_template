import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/services/request.dart';

Dio dio = DioRequest.getInstance().dio;

final detailProvoder = StateProvider(
  (ref) => {},
);
final testProvoder = FutureProvider.autoDispose(
  (ref) async {
    try {
      final photo = ref.watch(detailProvoder);
      // var res = await Dio()
      //   ..get(photo['imgURL'],
      //       options: Options(contentType: 'application/json; charset=utf-8'));
      var res = await dio.get(photo['imgURL']);
      return res;
    } catch (e) {
      dio.close(force: true);
    }
  },
);
