import 'dart:ui';

import 'package:equatable/equatable.dart';

class ApplicationUtil {
  ApplicationUtil(this.titles);

  List<String> titles = [];

  List<AppElement> get elements {
    var list = <AppElement>[];
    this.titles.forEach((element) {
      var re = _findByTitle(element);
      if (re != null) {
        list.add(re);
      }
    });
    return list;
  }

  AppElement? _findByTitle(String title) {
    for (var item in allApplications) {
      if (title == item.title) {
        return item;
      }
    }
  }

  List<AppElement> get allApplications => [];
}

class AppElement extends Equatable {
  final String title;
  final String imgPath;
  final VoidCallback onTap;

  const AppElement(
    this.title,
    this.imgPath,
    this.onTap,
  );

  @override
  List<Object?> get props => [
        title,
        imgPath,
        onTap,
      ];
}
