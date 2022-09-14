import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/pages/HomePage/animate_list/models/model.dart';
import 'package:template_1/services/request.dart';

Dio dio = DioRequest.getInstance().dio;

final detailNotifierProvider =
    StateNotifierProvider<DetailStoreNotifier, DetailsModel>((ref) {
  return DetailStoreNotifier();
});

class DetailStoreNotifier extends StateNotifier<DetailsModel> {
  DetailStoreNotifier()
      : super(const DetailsModel(
            userId: '',
            avatar: '',
            comments: [],
            details: '',
            imgArr: [],
            saying: '',
            username: ''));
  Future<void> getDetail(url, {Map<String, dynamic>? params}) async {
    Dio dio = DioRequest.getInstance().dio;
    Response res = await dio.get(url, queryParameters: params);
    Map map = res.data as Map;
    state = state.copyWith(
      details: map["details"],
      userId: map["userId"],
      imgArr: map['imgArr'],
      username: map["username"],
      avatar: map["avatar"],
      comments: map["comments"],
    );
  }
}
