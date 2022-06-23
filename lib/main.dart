import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '对齐(Alignment)与相对定位'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 50.0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.blue.shade100,
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red.shade100,
                  child: const Align(
                    alignment: Alignment(1.0, -1.0),
                    //仍然放到右上角是因为这个Alignment表示在水平和垂直方向的偏移
                    //以0,0为中心点，-1和1表示矩形的横向长度和纵向长度的一半
                    //左-右+，上-下+
                    //即Alignment(x,y)=(x*width/2+width/2,y*height/2+height/2)
                    widthFactor: 2,
                    heightFactor: 2,
                    //和上面的效果一样是因为LOGO的大小为60×60，加上2倍的放缩因子，得到120×120
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green.shade100,
                  child: const Align(
                    alignment: Alignment(2.0, 0),
                    //即(2*60/2+60/2,0*60/2+60/2)=(90,30)
                    widthFactor: 2,
                    heightFactor: 2,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue.shade100,
                  child: const Align(
                    alignment: Alignment(0, 0),
                    widthFactor: 2,
                    heightFactor: 2,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.red.shade100,
                  child: const Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    //(FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
                    //通过确定Alignment来确定坐标原点
                    //(0.2*60,0.6*60)=(12,36)
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.green.shade100,
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 36,
                        left: 12,
                        //(12,36)
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Center(
                widthFactor: null,
                heightFactor: 1,
                child: Text("宽度填充"),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("未填充"),
              ),
            ),
            SizedBox(
              height: _counter,
              child: Row(children: const [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Text("未填充"),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    widthFactor: 1,
                    heightFactor: null,
                    child: Text("高度填充"),
                  ),
                ),
              ]),
            ),
            SizedBox(
              width: _counter * 2,
              child: Column(children: const [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Center(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Text("未填充"),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Center(
                    widthFactor: null,
                    heightFactor: 1,
                    child: Text("宽度填充"),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
