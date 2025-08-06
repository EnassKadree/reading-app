import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share_plus/share_plus.dart';

void shareBookDetails({
  required String title,
  required String author,
  required String appLink,
  required String image,
}) async {
  final message = '''
come and join me reading this amazing book 
📚 $title
✍️ by $author
📲 download hourouf app via this link
$appLink
  ''';

  final cacheManager = DefaultCacheManager();
  final file = await cacheManager.getSingleFile(image);

  await Share.shareXFiles([XFile(file.path)], text: message);
}
