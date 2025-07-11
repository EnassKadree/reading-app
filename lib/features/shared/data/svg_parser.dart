import 'package:flutter/services.dart' show rootBundle;
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';
import 'package:flutter/material.dart';

class SvgParser {
  static Future<Map<String, Path>> loadSvgPaths(String assetPath) async {
    final svgString = await rootBundle.loadString(assetPath);
    final document = XmlDocument.parse(svgString);

    final Map<String, Path> paths = {};

    for (final node in document.findAllElements('path')) {
      final id = node.getAttribute('id');
      final d = node.getAttribute('d');
      if (id != null && d != null) {
        final path = parseSvgPathData(d);
        paths[id] = path;
      
      }
    }

    return paths;
  }
}
