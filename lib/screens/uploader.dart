import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;
  CloudStorageResult({this.imageUrl, this.imageFileName});
}

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File _imageFile;
  final picker = ImagePicker();

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      // maxWidth: 512,
      // maxHeight: 512,
      // toolbarColor: Colors.purple,
      // toolbarWidgetColor: Colors.white,
      // toolbarTitle: 'Crop It'
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
//  Future<void> _pickImage(ImageSource source) async {
//    File selected = await ImagePicker.pickImage(source: source);
//
//    setState(() {
//      _imageFile = selected;
//    });
//  }
//

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => getImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => getImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
            // Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }
}

//
// class Uploader extends StatefulWidget {
//   final File file;
//   Uploader({Key key, this.file}) : super(key: key);
//
//   _UploaderState createState() => _UploaderState();
// }
//
// class _UploaderState extends State<Uploader> {
//   // final FirebaseStorage _storage =
//   //     // ignore: deprecated_member_use
//   //     FirebaseStorage(storageBucket: 'gs://digi-locker-ae289.appspot.com');
//   // FirebaseFirestore _storage = FirebaseFirestore.instance;
//
//   firebase_storage.FirebaseStorage _storage =
//       firebase_storage.FirebaseStorage.instanceFor(
//           bucket: 'gs://digi-locker-ae289.appspot.com');
//
//   UploadTask _uploadTask;
//
//   /// Starts an upload task
//   void startUpload() {
//     /// Unique file name for the file
//    String filePath = 'images/${DateTime.now()}.png';
//     //
//      setState(() {
//     //   _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
//     //
//     //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//     //       .ref()
//     //       .child('images')
//     //       .child('defaultProfile.png');
//
//        Future<void> uploadFile(String filePath) async {
//          File file = File(filePath);
//
//          try {
//            await firebase_storage.FirebaseStorage.instance
//                .ref('uploads/file-to-upload.png')
//                .putFile(filePath);
//          } on firebase_core.FirebaseException catch (e) {
//            // e.g, e.code == 'canceled'
//          }
//        }
//
//
//      });
//
//
//
//
//
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
// //    if (_uploadTask != null) {
// //      /// Manage the task state and event subscription with a StreamBuilder
// //      return StreamBuilder<StorageTaskEvent>(
// //          stream: _uploadTask.events,
// //          builder: (_, snapshot) {
// //            var event = snapshot?.data?.snapshot;
// //
// //            double progressPercent = event != null
// //                ? event.bytesTransferred / event.totalByteCount
// //                : 0;
// //
// //            return Column(
// //              children: [
// //                if (_uploadTask.isComplete) Text('🎉🎉🎉'),
// //
// //                if (_uploadTask.isPaused)
// //                  FlatButton(
// //                    child: Icon(Icons.play_arrow),
// //                    onPressed: _uploadTask.resume,
// //                  ),
// //
// //                if (_uploadTask.isInProgress)
// //                  FlatButton(
// //                    child: Icon(Icons.pause),
// //                    onPressed: _uploadTask.pause,
// //                  ),
// //
// //                // Progress bar
// //                LinearProgressIndicator(value: progressPercent),
// //                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
// //              ],
// //            );
// //          });
// //    }
// //
// //   else {
//     // Allows user to decide when to start the upload
//     return FlatButton.icon(
//       label: Text('Upload to Firebase'),
//       icon: Icon(Icons.cloud_upload),
//       onPressed: _startUpload,
//     );
// //    }
//   }
// }
