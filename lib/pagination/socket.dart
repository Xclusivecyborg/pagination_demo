import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  final SocketManager customerSocketManager;
  // final SocketManager riderSocketManager;

  SocketClient({
    required this.customerSocketManager,
    // required this.riderSocketManager,
  });

  void trackCurrentLocation() {
    customerSocketManager._socket.emit(
      'trackCurrentLocation',
      {
        "lat": "6.465422",
        "lon": "3.406448",
        "userId": "64da662f257daca1b2b6b953",
      },
    );
    customerSocketManager._socket.on('trackCurrentLocation', (data) {
      debugLog(data);
    });
  }
}

class SocketManager {
  late Socket _socket;
  final String websocketUrl;
  SocketManager(this.websocketUrl) {
    init();
  }

  void init() {
    _socket = io(
      websocketUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .disableAutoConnect()
          .build(),
    );

    _socket.connect();

    _socket.onConnect((v) {
      debugLog('connected to web socket');
    });

    _socket.onDisconnect((v) {
      debugLog('disconnected from web socket');
    });
    _socket.onConnectError((data) {
      debugLog('erroe from web socket');
    });
  }
}

void debugLog(var s) {
  log('$s');
}

final customerSocketManager = Provider<SocketManager>((ref) {
  return SocketManager('ws://20.25.47.125');
});
// final riderSocketManager = Provider<SocketManager>((ref) {
//   return SocketManager('ws://20.25.47.125/rider-socket');
// });

final socketclient = Provider<SocketClient>((ref) {
  return SocketClient(
    customerSocketManager: ref.read(customerSocketManager),
    // riderSocketManager: ref.read(riderSocketManager),
  );
});
