import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Upload",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  bool _uploaded = false;
  bool _downloaded = false;
  String _downloadUrl;
  StorageReference _reference =
      FirebaseStorage.instance.ref().child('myimage.jpg');

// create methods to choose images from camera and gallery respectively

  Future getImage(bool isCamera) async {
    File image;

    // if we captured the image from camera then continue
    // open camera, pick image, and return the image file which
    // will be stored inside a state variable, imageFile
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    // if it is not from camera, take the photo from gallery
    else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    // set the state to the newly received image file
    setState(() {
      _imageFile = image;
    });
  }

  Future uploadImage() async {
    // upload the image to firebase storage
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    // update the uploaded state to true after uploading the image to firebase
    setState(() {
      _uploaded = true;
    });
  }

  // get the download url of the image and set the downloaded flag variable to true
  Future downloadImage() async {
    String _downloadedImageUrl = await _reference.getDownloadURL();

    // set the download url state to the url received from firebase
    setState(() {
      _downloadUrl = _downloadedImageUrl;
      _downloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pocket Museum")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Camera'),
                onPressed: () {
                  // pass true to getImage because we want to use camera
                  getImage(true);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Gallery'),
                onPressed: () {
                  // pass false to getImage because we want to use gallery
                  getImage(false);
                },
              ),

              // if there is no image selected, return an empty container
              // but if there is an image then display it.
              _imageFile == null
                  ? Container()
                  : Image.file(
                      _imageFile,
                      height: 300.0,
                      width: 300.0,
                    ),

// if the image is not selected don't show the option to upload to firebase storage
              _imageFile == null
                  ? Container()
                  : RaisedButton(
                      child: Text("Upload to Firebase Storage"),
                      onPressed: () {
                        uploadImage();
                      },
                    ),

              // once the upload is complete, then  allow for
              // the user to download the image by calling the
              // downloadImage function which also returns the url
              // of the downloaded image
              _uploaded == false
                  ? Container()
                  : RaisedButton(
                      child: Text('Download Image'),
                      onPressed: () {
                        downloadImage();
                      },
                    ),

              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

              //if the user does not click on "Download Image" then display a container else display the download url received from firebase

              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              _downloaded == false
                  ? Container()
                  : RaisedButton(
                      child: Text("Download Url: " + _downloadUrl),
                    ),

              // if the download url is null, display a blank container
              // else display the downloaded image
              _downloadUrl == null ? Container() : Image.network(_downloadUrl),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The users can snap a pic from camera or pick a pic from gallery and it will be shown to the user, then they can upload that picture to firebase
// and choose to download the previously uploaded picture from firebase (I think that the downloaded picture will be saved in the gallery)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
