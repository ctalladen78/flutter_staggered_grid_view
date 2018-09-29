import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ImageGrid.dart';
import 'sliver.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();

}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static const Curve scrollCurve = Curves.fastOutSlowIn;
  final PageController controller = new PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Staggered Image Grid',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: new ImageTile(),
      home: new Scaffold(
        // body: new ImageTile(),
        body: new PageView(
          controller: controller,
          onPageChanged: (idx) => setState(() => _currentIndex = idx),
          children: <Widget>[
            new SliverSamplePage(),
            new ImageTile(),
            // new ImageTile()
          ],

        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              controller.animateToPage(
                _currentIndex,
                duration: kTabScrollDuration,
                curve: scrollCurve,
              );
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.image),
              title: new Text('Image'),
            ),
           
          ],
        ),
      ),
    );
  }
}

/*
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];


List<Widget> _tiles = const <Widget>[
  const _ImageTile('https://picsum.photos/200/300/?random'),
  const _ImageTile('https://picsum.photos/201/300/?random'),
  const _ImageTile('https://picsum.photos/202/300/?random'),
  const _ImageTile('https://picsum.photos/203/300/?random'),
  const _ImageTile('https://picsum.photos/204/300/?random'),
  const _ImageTile('https://picsum.photos/205/300/?random'),
  const _ImageTile('https://picsum.photos/206/300/?random'),
  const _ImageTile('https://picsum.photos/207/300/?random'),
  const _ImageTile('https://picsum.photos/208/300/?random'),
  const _ImageTile('https://picsum.photos/209/300/?random'),
];

class ImageTile extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Staggered Image Grid'),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )));
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile(this.gridImage);

  final gridImage;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: const Color(0x00000000),
      elevation: 3.0,
      child: new GestureDetector(
        onTap: () {
          print("hello");
          print(this.gridImage);
        },
        child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(gridImage),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            )
        ),
      ),
    );
  }
}
*/