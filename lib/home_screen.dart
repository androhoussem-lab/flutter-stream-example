import 'package:flutter/material.dart';
import 'package:flutter_stream/ticker_presenter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TickerPresenter tickerPresenter = TickerPresenter();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    tickerPresenter.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream App'),
      ),
      body: StreamBuilder<int>(
        stream: tickerPresenter.tickerStream,
        builder: (BuildContext context, AsyncSnapshot <int> snapshot) {

         switch(snapshot.connectionState){

           case ConnectionState.none:
             return Text(snapshot.error);
             break;
           case ConnectionState.waiting:
           return Center(child: CircularProgressIndicator());
             break;
           case ConnectionState.active:
           case ConnectionState.done:
             if(snapshot.data != null){
               return Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(snapshot.data.toString(),style: TextStyle(fontSize: 24),),
                   SizedBox(height: 16,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       RaisedButton(color: Colors.red , child: Icon(Icons.add , color: Colors.white,),onPressed: (){tickerPresenter.increment.add(snapshot.data);}),
                       RaisedButton(color: Colors.red , child: Icon(Icons.remove , color: Colors.white,),onPressed: (){tickerPresenter.decrement.add(snapshot.data);}),
                     ],
                   )
                 ],
               );
             }
             break;
         }
         return null;
        }
      ),
    );
  }
}
