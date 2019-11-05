import 'package:bloc_sample/src/models/image_model.dart';
import 'scenery_image_provider.dart';

class Repository {
  final provider = new SceneryImageProvider();

  Future<List<ImageModel>> fetchAllProvider() => provider.fetchImageList();
}
