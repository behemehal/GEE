import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource camera) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ImagePicker Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Image_Picker Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _image != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Image.file(
                          _image,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('No image selected'),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => getImage(ImageSource.gallery),
                  icon: Icon(Icons.image),
                  label: Text('gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: () => getImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('camera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
