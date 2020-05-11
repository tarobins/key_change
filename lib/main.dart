import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  Key key = ValueKey('key0');
  ItemScrollController itemScrollController = ItemScrollController();

  void changeKey() {
    setState(() {
      key = ValueKey('key1');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key is ${key.toString()}'),
      ),
      body: Center(
        child: ScrollablePositionedList.builder(
          key: key,
          itemCount: 4,
          itemScrollController: itemScrollController,
          itemBuilder: (context, index) => ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 60),
            child: DecoratedBox(
              decoration:
              BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                'Item $index',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeKey,
        tooltip: 'Jump',
        child: Icon(Icons.airline_seat_recline_normal),
      ),
    );
  }
}
