import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/core/network/network_client.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
String authToken(Ref ref) {
  // Congratulations: you find my token!
  return 'MsdFmyKjVum0wk0H7NBz4LQy';
}

@Riverpod(keepAlive: true)
NetworkClient networkClient(Ref ref) {
  final token = ref.watch(authTokenProvider);
  return NetworkClient(token);
}

@riverpod
class NetworkState extends _$NetworkState {
  @override
  Stream<bool> build() {
    return Connectivity().onConnectivityChanged.map(
      (res) => res.first != ConnectivityResult.none,
    );
  }
}

@riverpod
Future<bool> isConnected (Ref ref) async {
  final connectivity = await Connectivity().checkConnectivity();
  return connectivity.first != ConnectivityResult.none;
}
