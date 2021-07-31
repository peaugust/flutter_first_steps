import 'dart:async';

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_count < 1) {
        _controller.sink.add(_count);
        _count += 0.01;
      } else {
        _count = 0.0;
      }
    });
  }

  var _count = 0.0;

  // ignore: close_sinks
  final _controller = StreamController<double>();

  Stream<double> get stream => _controller.stream;
}
