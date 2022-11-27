import 'package:bases_web/ui/views/counter.dart';
import 'package:bases_web/ui/views/counter_provider.dart';
import 'package:bases_web/ui/views/view_404.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      "/",
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      "/stateful",
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      "/stateful/:base",
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      "/provider",
      handler: _counterHandlerProvider,
      transitionType: TransitionType.fadeIn,
    );
    router.notFoundHandler = _notFoundHandler;
  }

  static final Handler _counterHandler =
      Handler(handlerFunc: (context, params) {
    return CounterView(base: params['base']?[0] ?? '5');
  });
  static final Handler _counterHandlerProvider =
      Handler(handlerFunc: (context, params) => const CounterProviderView());
  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, params) => const View404());
}
