import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  bool _spinner = false;
  File _image;
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = selected;
      _spinner = false;
    });
  }

  Future uploadToFirebase(BuildContext context) async {}

  void clear() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    if (_image != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              onPressed: () {
                                clear();
                              },
                              child: Icon(
                                Icons.refresh,
                                color: Colors.red,
                              )),
                          FlatButton(
                              onPressed: () {
                                clear();
                              },
                              child: Icon(Icons.check, color: Colors.green)),
                        ],
                      ),
                      Image.file(_image),
                    ] else ...[
                      Text(
                        'upload image',
                        style: TextStyle(fontSize: 40),
                      )
                    ]
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.orange,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _spinner = true;
                                _pickImage(ImageSource.camera);
                              });
                            },
                            icon: Icon(Icons.camera_alt)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: IconButton(
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.image),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
