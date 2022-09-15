import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/pages/HomePage/customScrollView_joko/models/model.dart';
import 'package:template_1/services/request.dart';

final pageProvoder = StateProvider.autoDispose(
  (ref) => 1,
);

// final pageListProvoder = FutureProvider.autoDispose(
//   (ref) async {
//     try {
//       final pageList = ref.watch(pageProvoder);
//       // var res = await Dio()
//       //   ..get(photo['imgURL'],
//       //       options: Options(contentType: 'application/json; charset=utf-8'));
//       Response res = await dio
//           .get("http://127.0.0.1:4523/mock/965395/mainPage?page=$pageProvoder");
//       return res;
//     } catch (e) {
//       dio.close(force: true);
//     }
//   },
// );

final listStoreNotifierProvider =
    StateNotifierProvider<ListStoreNotifier, List<ListStore>>((ref) {
  return ListStoreNotifier();
});

class ListStoreNotifier extends StateNotifier<List<ListStore>> {
  ListStoreNotifier() : super([]);
  void addListStore(ListStore listStore) {
    state = [...state, listStore];
  }

  //请求数据
  Future<void> getList(int page) async {
    Dio dio = DioRequest.getInstance().dio;

    Response res =
        await dio.get("http://127.0.0.1:4523/mock/965395/mainPage?page=$page");
    List<ListStore> _list = [];
    for (var _detail in res.data as List) {
      _list.add(ListStore(
          userId: _detail['userId'],
          saying: _detail['saying'],
          avatar: _detail['avatar'],
          imgArr: _detail['imgArr'],
          username: _detail['username']));
    }
    state = [...state, ..._list];
  }
}
