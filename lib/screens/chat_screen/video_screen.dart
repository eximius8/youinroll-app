import 'package:flutter/material.dart';


class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Создайте видео конференцию'),

        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: Text(
                  'Новый видеочат',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: TextButton(
                  onPressed: () => print("Creating a room...."),
                  child: Text(
                    'Создать комнату',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ]),
        /* floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _count++),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),*/
      ),
    );
  }
}





