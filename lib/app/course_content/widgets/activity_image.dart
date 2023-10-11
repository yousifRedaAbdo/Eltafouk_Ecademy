import 'package:flutter/material.dart';

Widget activityImage({
  required String modName,
  required String resourceType,
}) {
  if (modName == 'page') {
    return Image.asset(
      'assets/icons/video.png',
      height: 35,
    );
  }
  if (modName == 'resource' && modName == 'resource') {
    return Image.asset(
      'assets/icons/video.png',
      height: 35,
    );
  }

  if (modName == 'quiz' && modName == 'quiz') {
    return Image.asset(
      'assets/icons/task.png',
      height: 35,
    );
  }

  if (modName == 'testnew') {
    return Image.asset(
      'assets/icons/file.png',
      height: 35,
    );
  }
  if (modName == 'assign') {
    return Image.asset(
      'assets/icons/homework.png',
      height: 35,
    );
  }

  return Image.asset(
    'assets/icons/file.png',
    height: 35,
  );
}