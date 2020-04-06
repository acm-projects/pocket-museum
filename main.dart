// We're going to need these packages for accessing the Clipboard, themes, and files
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_museum_final/blocs/theme.dart';
import 'package:provider/provider.dart';
import 'dart:io';

// Packages for the camera and uploading the images to firebase
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// To create alerts for the various actions we take.
import 'package:rflutter_alert/rflutter_alert.dart';

// Use these for changing the fonts
List<bool> isSelected = [false, true, false];
List<String> fonts = ['ComicNeue', 'Montserrat', 'OpenSans'];
String fam = fonts[1];

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Setting up some things, like removing the glow - this can be modified in ScrollBehavior
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Pocket Museum',
      debugShowCheckedModeBanner: true,
      theme: theme.getTheme(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: Home(),
    );
  }
}

// removes the glow
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

// Creates the home/main page for the app
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HPState();
  }
}

class _HPState extends State<Home> {
  File _imageFile;
  bool _uploaded = false;
  String _downloadUrl;
  String myImageName;

   StorageReference _reference;
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

  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      getImage(true);
      super.initState();
    });
    // super.initState();
  }

  Future uploadImage() async {
    // upload the image to firebase storage
    myImageName = _imageFile.toString() + DateTime.now().toString();
    _reference =
      FirebaseStorage.instance.ref().child(myImageName);
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    // update the uploaded state to true after uploading the image to firebase
    setState(() {
      _uploaded = true;
    });
  }

  // get the download url of the image and set the downloaded flag variable to true
  Future downloadImage() async {
    String _downloadedImageUrl = await  FirebaseStorage.instance.ref().child(myImageName).getDownloadURL();
    // set the download url state to the url received from firebase
    setState(() {
      _downloadUrl = _downloadedImageUrl;
      Clipboard.setData(ClipboardData(text: _downloadUrl));
    });
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: fam),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
        color: Colors.orange[800],
        fontWeight: FontWeight.bold,
        fontFamily: fam),
  );

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Pocket Museum", style: TextStyle(fontFamily: fam)),
          backgroundColor: Colors.orange[800],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Modify Image",
                  style: TextStyle(
                      fontFamily: fam,
                      fontSize: 30,
                      decoration: TextDecoration.underline)),
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
                    color: Colors.orange[800],
                    child: Text("Upload to Firebase Storage",
                        style: TextStyle(fontFamily: fam)),
                    onPressed: () {
                      Alert(
                        context: context,
                        style: alertStyle,
                        title: "Your artwork has been sent!",
                        buttons: [
                          DialogButton(
                            color: Colors.orange[800],
                            child: Text(
                              "Righteous!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fam),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                            radius: BorderRadius.circular(0.0),
                          )
                        ],
                      ).show();

                      uploadImage();
                    },
                  ),
            // if the image is not selected don't show the option to upload to firebase storage
            _imageFile == null
                ? Container()
                : RaisedButton(
                    color: Colors.orange[800],
                    child:
                        Text("Take Another Image", style: TextStyle(fontFamily: fam)),
                    onPressed: () {
                      _uploaded = false;
                      getImage(true);
                    },
                  ),

            // once the upload is complete, then  allow for
            // the user to download the image by calling the
            // downloadImage function which also returns the url
            // of the downloaded image
            _uploaded == false
                ? Text("Press Upload to Firebase to find out more info!",
                    style: TextStyle(fontFamily: fam))
                : RaisedButton(
                    color: Colors.orange[800],
                    child: Text('Copy URL', style: TextStyle(fontFamily: fam)),
                    onPressed: () {
                      downloadImage();
                      Alert(
                        context: context,
                        style: alertStyle,
                        title: "Copied to Clipboard!",
                        buttons: [
                          DialogButton(
                            color: Colors.orange[800],
                            child: Text(
                              "Righteous!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fam),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                            radius: BorderRadius.circular(0.0),
                          )
                        ],
                      ).show();
                    },
                  ),
            //Font Settings
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Settings",
                  style: TextStyle(
                      fontFamily: fam,
                      fontSize: 30,
                      decoration: TextDecoration.underline)),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                Widget>[
              Text("Font: ", style: TextStyle(fontFamily: fam, fontSize: 20)),
              ToggleButtons(
                children: <Widget>[
                  Text("A",
                      style: TextStyle(fontFamily: 'Comic Neue', fontSize: 10)),
                  Text("A",
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 10)),
                  Text("A",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 10)),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                        fam = fonts[buttonIndex];
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Toggle Mode: ",
                  style: TextStyle(fontFamily: fam, fontSize: 20),
                ),
                Switch(
                  value: (_themeChanger.getTheme() == ThemeData.dark()),
                  onChanged: (value) {
                    setState(() {
                      _themeChanger.getTheme() == ThemeData.dark()
                          ? _themeChanger.setTheme(ThemeData.light())
                          : _themeChanger.setTheme(ThemeData.dark());
                    });
                  },
                  activeTrackColor: Colors.orange[500],
                  activeColor: Colors.orange[800],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                'assets/images/TranspMuseum.png',
                width: 100,
                height: 100,
                scale: 5,
              ),
            ),
          ])),
        ));
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }
}
