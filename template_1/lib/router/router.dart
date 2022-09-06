import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_1/pages/HomePage/index.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return _goRouter;
});

GoRouter _goRouter = GoRouter(debugLogDiagnostics: true, routes: <GoRoute>[
  GoRoute(
      path: '/',
      builder: (context, GoRouterState) => MyHomePage_joko(),
      name: 'home',
      routes: [
        // GoRoute(
        //     path: 'family/:fid',
        //     name: 'family',
        //     builder: (constants, GoRouterState state) =>
        //         family(id: state.params['fid']!),
        //     routes: [
        //       GoRoute(
        //           path: 'person/:pid',
        //           name: 'person',
        //           builder: (_goRouter, GoRouterState state) => person(
        //               fid: state.params['fid']!, pid: state.params['pid']!))
        //     ])
      ]),
  // GoRoute(path: "/detail", builder: (context, GoRouterState) => detail())
]);
