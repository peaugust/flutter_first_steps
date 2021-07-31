import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:streams_testing/utils/number_creator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final numberCreator = NumberCreator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streams Testing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Streams Testing App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: numberCreator.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text(
                      'Waiting data arrive...',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    );
                  } else {
                    return CircularPercentIndicator(
                      arcType: ArcType.HALF,
                      radius: 250.0,
                      startAngle: 220,
                      animation: false,
                      lineWidth: 5.0,
                      percent: double.parse(snapshot.data.toString()),
                      center: Stack(
                        children: [
                          Text(
                            '${(double.parse(snapshot.data.toString()) * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      progressColor: Colors.red,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
