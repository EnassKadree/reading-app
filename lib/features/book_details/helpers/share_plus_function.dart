import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void shareBookDetails({
  required String title,
  required String author,
  required String appLink,
}) async {
  final message = '''
  come and join me reading this amazing book 
📚 $title
✍️ by  $author
📲 download hourouf app via this link
$appLink
  ''';
  final ByteData bytes = await rootBundle.load('assets/images/png/book 1.jpg');
  final Directory tempDir = await getTemporaryDirectory();
  final File file = File('${tempDir.path}/homs.png');
  await file.writeAsBytes(bytes.buffer.asUint8List());
  await Share.shareXFiles([XFile(file.path)], text: message);
}
