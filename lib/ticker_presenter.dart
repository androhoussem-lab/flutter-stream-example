import 'dart:async';
class TickerPresenter{
  int _ticker;

  final StreamController<int> _tickerController = StreamController<int>();

  Stream<int> get tickerStream => _tickerController.stream;

  StreamSink<int> get tickerSink => _tickerController.sink;

  final StreamController<int> _incrementController = StreamController<int>();

  StreamSink<int> get increment => _incrementController.sink;

  final StreamController<int> _decrementController = StreamController<int>();

  StreamSink<int> get decrement => _decrementController.sink;


  TickerPresenter(){
    _ticker = 0;
    _tickerController.add(_ticker);
    _incrementController.stream.listen(_increment);
    _decrementController.stream.listen(_decrement);
  }



  void _increment(int ticker){
    ticker++;
    tickerSink.add(ticker);
  }
  void _decrement(int ticker){
    ticker--;
    tickerSink.add(ticker);
  }

  void dispose(){
    _tickerController.close();
    _incrementController.close();
    _decrementController.close();
  }

}