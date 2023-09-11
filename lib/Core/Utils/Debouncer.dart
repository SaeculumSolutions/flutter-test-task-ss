import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer._({required this.milliseconds});

  static final Debouncer _instance = Debouncer._(milliseconds: 50);

  factory Debouncer() => _instance;

  void run(Function action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action();
    });
  }
}
