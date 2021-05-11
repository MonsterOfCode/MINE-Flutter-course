import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/business_logic/stores/ad/create.ad.store.dart';
import 'package:olx_clone/ui/widgets/ad/image_source_modal.widget.dart';
import 'package:olx_clone/ui/widgets/image.dialog.widget.dart';

class ImagesFieldWidget extends StatelessWidget {
  const ImagesFieldWidget({Key key, this.store}) : super(key: key);

  final CreateAdStore store;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      if (image != null) store.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      height: 120,
      color: Colors.grey[200],
      child: Observer(
        builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store.images.length < 2 ? store.images.length + 1 : 2,
          itemBuilder: (_, index) {
            return index == store.images.length
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(context: context, builder: (_) => ImageSourceModalWidget(callback: onImageSelected));
                        } else {
                          showCupertinoModalPopup(context: context, builder: (_) => ImageSourceModalWidget(callback: onImageSelected));
                        }
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 40, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, index == 4 ? 8 : 0, 16),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                            image: store.images[index],
                            onDelete: () => store.images.removeAt(index),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundImage: FileImage(store.images[index]),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
