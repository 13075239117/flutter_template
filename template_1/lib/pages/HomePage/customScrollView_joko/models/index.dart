import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/services/request.dart';

Dio dio = DioRequest.getInstance().dio;

final pageProvoder = StateProvider.autoDispose(
  (ref) => 1,
);
final pageListProvoder = FutureProvider.autoDispose(
  (ref) async {
    try {
      final pageList = ref.watch(pageProvoder);
      // var res = await Dio()
      //   ..get(photo['imgURL'],
      //       options: Options(contentType: 'application/json; charset=utf-8'));
      Response res = await dio
          .get("http://127.0.0.1:4523/mock/965395/mainPage?page=$pageProvoder");
      return res;
    } catch (e) {
      dio.close(force: true);
    }
  },
);
