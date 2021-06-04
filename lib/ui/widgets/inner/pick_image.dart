// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> akuPickImage() async {
  return await showCupertinoModalPopup(
    context: Get.context!,
    builder: (context) {
      return CupertinoActionSheet(
        title: Text('选择图片'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              ImagePicker()
                  .getImage(
                source: ImageSource.camera,
                maxHeight: 600,
                maxWidth: 600,
              )
                  .then((file) {
                Get.back(result: File(file!.path));
              });
            },
            child: Text('拍照'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              ImagePicker()
                  .getImage(
                source: ImageSource.gallery,
                maxHeight: 600,
                maxWidth: 600,
              )
                  .then((file) {
                Get.back(result: File(file!.path));
              });
            },
            child: Text('相册'),
          ),
        ],
        cancelButton: CupertinoButton(
          child: Text('取消'),
          onPressed: () => Get.back(),
        ),
      );
    },
  );
}
