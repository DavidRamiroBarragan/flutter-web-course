import 'package:bases_web/ui/views/counter.dart';
import 'package:bases_web/ui/views/counter_provider.dart';
import 'package:bases_web/ui/views/view_404.dart';
import 'package:fluro/fluro.dart';

final Handler counterHandler = Handler(handlerFunc: (context, params) {
  return CounterView(base: params['base']?.first ?? '5');
});
final Handler counterHandlerProvider = Handler(handlerFunc: (context, params) {
  return CounterProviderView(base: params['q']?.first ?? '5');
});
final Handler notFoundHandler =
    Handler(handlerFunc: (context, params) => const View404());
