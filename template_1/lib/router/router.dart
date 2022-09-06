import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProviderName = Provider<GoRouter>((ref) {
  return _goRouter;
});
