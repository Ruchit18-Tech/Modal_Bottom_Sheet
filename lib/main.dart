import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Modal BottomSheet';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: OutlinedButton(
          onPressed: showBottomSheet,
          child: const Text('Add'),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ))
      );

  void showBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        barrierColor: const Color(0xff246EE9).withOpacity(0.2),
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                Navigator.of(context).pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text('Download'),
              onTap: () => {},
            ),
          ],
        ),
      );
}
