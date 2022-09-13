import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/pages/HomePage/animate_list/models/model.dart';
import 'package:template_1/services/request.dart';

Dio dio = DioRequest.getInstance().dio;

final detailProvoder = StateProvider.autoDispose(
  (ref) => {},
);
final testProvoder = FutureProvider.autoDispose(
  (ref) async {
    try {
      final photo = ref.watch(detailProvoder);
      // var res = await Dio()
      //   ..get(photo['imgURL'],
      //       options: Options(contentType: 'application/json; charset=utf-8'));
      var res = await dio.get("http://pic.bizhi360.com/litimg/10799.jpg");
      return res;
    } catch (e) {
      dio.close(force: true);
    }
  },
);

class DetailStoreNotifier extends StateNotifier<DetailsModel> {
  DetailStoreNotifier()
      : super(const DetailsModel(
            avatar: '', comments: [], imgArr: [], saying: '', username: ''));
  Future<void> getDetail(Map params) async {}
}
