import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModalWidget extends StatelessWidget {
  const ImageSourceModalWidget({Key key, this.callback}) : super(key: key);

  final Function(File) callback;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? BottomSheet(
            onClosing: () {},
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  child: const Text("Camera"),
                  onPressed: getFromCamera,
                ),
                TextButton(
                  child: const Text("Galery"),
                  onPressed: getFromGallery,
                )
              ],
            ),
          )
        : CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
                onPressed: Navigator.of(context).pop,
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                )),
            actions: [
              CupertinoActionSheetAction(onPressed: getFromCamera, child: const Text("Camera")),
              CupertinoActionSheetAction(onPressed: getFromGallery, child: const Text("Gallery")),
            ],
          );
  }

  Future<void> getFromCamera() async {
    final file = await ImagePicker().getImage(source: ImageSource.camera);
    if (file == null) return;
    imageSelected(File(file.path));
  }

  Future<void> getFromGallery() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    if (file == null) return;
    imageSelected(File(file.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Edit Image",
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: "Edit Image",
        cancelButtonTitle: "Cancel",
        doneButtonTitle: "Done",
      ),
    );
    callback(croppedImage);
  }
}
