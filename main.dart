import 'package:flutter/material.dart';
import 'package:pocket_museum_final/blocs/theme.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

bool isSwitched;
List<bool> isSelected = [false, true, false];
List<String> fonts = ['ComicNeue', 'Montserrat', 'OpenSans'];
String username = "John Doe";
String pass = "test1234";
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
  // login page parameters:
  // primary swatch color
  static const primarySwatch = Colors.orange;
  // button color
  static const buttonColor = Colors.orange;
  // app name
  static const appName = 'Pocket Museum';
  // boolean for showing home page if user unverified
  static const homePageUnverified = false;

  final params = {
    'appName': appName,
    'primarySwatch': primarySwatch,
    'buttonColor': buttonColor,
    'homePageUnverified': homePageUnverified,
  };
  @override
  Widget build(BuildContext context) {
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
      //initialRoute: '/',
      initialRoute: '/fourth',
      routes: {
        // '/': (context) => SettingsPage(),
        // '/second': (context) => Profile(),
        // '/third': (context) => Login(),
        '/fourth': (context) => Home(),
      },
    );
    //home: new RootPage(params: params, auth: new Auth()));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageCreateState createState() => _SettingsPageCreateState();
}

class _SettingsPageCreateState extends State<SettingsPage> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Settings', style: TextStyle(fontFamily: fam)),
        leading: FlatButton(
            child: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => print("back")),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text(
              "Profile",
              style: TextStyle(
                  fontFamily: fam, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pushNamed(context, '/second'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              //TODO: Implement Swiping upwards
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Go to Camera: ↑",
                    style: TextStyle(
                        fontFamily: fam, fontSize: 20, color: Colors.blueGrey)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              //TODO: Implement Username functionality
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Username: ",
                    style: TextStyle(fontFamily: fam, fontSize: 20)),
                Text("$username",
                    style: TextStyle(fontFamily: fam, fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              //TODO: Implement Password functionality
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Password: ",
                    style: TextStyle(fontFamily: fam, fontSize: 20)),
                Text("$pass", style: TextStyle(fontFamily: fam, fontSize: 20))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Font: ", style: TextStyle(fontFamily: fam, fontSize: 20)),
                ToggleButtons(
                  children: <Widget>[
                    Text("A",
                        style:
                            TextStyle(fontFamily: 'Comic Neue', fontSize: 10)),
                    Text("A",
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 10)),
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
                )
              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* FlatButton(
              child: Text('Switch Theme'),
              onPressed: () => _themeChanger.getTheme() == ThemeData.dark()
                  ? _themeChanger.setTheme(ThemeData.light())
                  : _themeChanger.setTheme(ThemeData.dark()),
            ), */

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
              ]),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile", style: TextStyle(fontFamily: fam)),
          backgroundColor: Colors.orange[700]),
      body: Center(
        child: RaisedButton(
          child: Text('Login!', style: TextStyle(fontFamily: fam)),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginPageCreateState createState() => _LoginPageCreateState();
}

class _LoginPageCreateState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Toggles the password show status

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                /* Row(
                  children: <Widget>[
                    BackButton(
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ), */ // Back Button],),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Image.asset(
                    'assets/images/TranspMuseum.png',
                    width: 100,
                    height: 100,
                    scale: 5,
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Pocket Museum',
                    style: TextStyle(
                        fontFamily: fam,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontFamily: fam, fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: new TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: new InputDecoration(
                        enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange[800]),
                        ),
                        hintText: 'Email',
                        icon: new Icon(
                          Icons.mail,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value.isEmpty ? 'Email can\'t be empty' : null,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: new TextFormField(
                    maxLines: 1,
                    obscureText: true,
                    autofocus: false,
                    decoration: new InputDecoration(
                        enabledBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange[800]),
                        ),
                        hintText: 'Password',
                        icon: new Icon(
                          Icons.lock,
                          color: Colors.grey,
                        )),
                    validator: (value) =>
                        value.isEmpty ? 'Password can\'t be empty' : null,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.orange,
                  child: Text('Forgot Password',
                      style: TextStyle(fontFamily: fam)),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orange,
                      child: Text('Login', style: TextStyle(fontFamily: fam)),
                      onPressed: () {
                        //authentication here
                        Navigator.pushNamed(context, '/');
                        print(nameController.text);
                        print(passController.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('No account?', style: TextStyle(fontFamily: fam)),
                    FlatButton(
                      textColor: Colors.orange,
                      child: Text('Sign up', style: TextStyle(fontFamily: fam)),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HPState();
  }
}

class _HPState extends State<Home> {
  @override
  File _imageFile;
  bool _uploaded = false;
  bool _downloaded = false;
  String _downloadUrl;
  StorageReference _reference =
      FirebaseStorage.instance.ref().child('myimage.jpg');
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
      appBar: AppBar(
        title: Text("Pocket Museum", style: TextStyle(fontFamily: fam)),
        backgroundColor: Colors.orange[800],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
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
                      uploadImage();
                    },
                  ),
            // if the image is not selected don't show the option to upload to firebase storage
            _imageFile == null
                ? Container()
                : RaisedButton(
                    color: Colors.orange[800],
                    child:
                        Text("Retake Image", style: TextStyle(fontFamily: fam)),
                    onPressed: () {
                      getImage(true);
                    },
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
          ],
        ),
      )),
    );
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }
}

// class _HomePageState extends State<Home> {
//   File _imageFile;
//   bool _uploaded = false;
//   bool _downloaded = false;
//   String _downloadUrl;
//   StorageReference _reference =
//       FirebaseStorage.instance.ref().child('myimage.jpg');

// // create methods to choose images from camera and gallery respectively

//   Future getImage(bool isCamera) async {
//     File image;

//     // if we captured the image from camera then continue
//     // open camera, pick image, and return the image file which
//     // will be stored inside a state variable, imageFile
//     if (isCamera) {
//       image = await ImagePicker.pickImage(source: ImageSource.camera);
//     }
//     // if it is not from camera, take the photo from gallery
//     else {
//       image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     }

//     // set the state to the newly received image file
//     setState(() {
//       _imageFile = image;
//     });
//   }

//   Future uploadImage() async {
//     // upload the image to firebase storage
//     StorageUploadTask uploadTask = _reference.putFile(_imageFile);
//     StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

//     // update the uploaded state to true after uploading the image to firebase
//     setState(() {
//       _uploaded = true;
//     });
//   }

//   // get the download url of the image and set the downloaded flag variable to true
//   Future downloadImage() async {
//     String _downloadedImageUrl = await _reference.getDownloadURL();

//     // set the download url state to the url received from firebase
//     setState(() {
//       _downloadUrl = _downloadedImageUrl;
//       _downloaded = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pocket Museum"),
//         backgroundColor: Colors.orange[800],
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 child: Text('Camera'),
//                 onPressed: () {
//                   // pass true to getImage because we want to use camera
//                   getImage(true);
//                 },
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               RaisedButton(
//                 child: Text('Gallery'),
//                 onPressed: () {
//                   // pass false to getImage because we want to use gallery
//                   getImage(false);
//                 },
//               ),

//               // if there is no image selected, return an empty container
//               // but if there is an image then display it.
//               _imageFile == null
//                   ? Container()
//                   : Image.file(
//                       _imageFile,
//                       height: 300.0,
//                       width: 300.0,
//                     ),

// // if the image is not selected don't show the option to upload to firebase storage
//               _imageFile == null
//                   ? Container()
//                   : RaisedButton(
//                       child: Text("Upload to Firebase Storage"),
//                       onPressed: () {
//                         uploadImage();
//                       },
//                     ),

//               // once the upload is complete, then  allow for
//               // the user to download the image by calling the
//               // downloadImage function which also returns the url
//               // of the downloaded image
//               _uploaded == false
//                   ? Container()
//                   : RaisedButton(
//                       child: Text('Download Image'),
//                       onPressed: () {
//                         downloadImage();
//                       },
//                     ),

//               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//               //if the user does not click on "Download Image" then display a container else display the download url received from firebase

//               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//               _downloaded == false
//                   ? Container()
//                   : RaisedButton(
//                       child: Text("Download Url: "),
//                       onPressed: () {
//                         print("Yes");
//                       },
//                     ),

//               // if the download url is null, display a blank container
//               // else display the downloaded image
//               _downloadUrl == null ? Container() : Image.network(_downloadUrl),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
