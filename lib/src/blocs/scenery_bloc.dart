import 'package:rxdart/rxdart.dart';
import 'package:bloc_sample/src/models/image_model.dart';
import 'package:bloc_sample/src/resources/repository.dart';

class SceneryBloc {
  final _repository = Repository();
  final _sceneryFetcher = PublishSubject<List<ImageModel>>();

  Observable<List<ImageModel>> get allScenery => _sceneryFetcher.stream;

  fetchAllScenery() async {
    List<ImageModel> imageModelList = await _repository.fetchAllProvider();
    _sceneryFetcher.sink.add(imageModelList);
  }

  dispose() {
    _sceneryFetcher.close();
  }
}
