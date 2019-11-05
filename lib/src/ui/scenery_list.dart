import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/src/blocs/scenery_bloc.dart';
import 'package:bloc_sample/src/models/image_model.dart';

class SceneryList extends StatelessWidget {
  final _bloc = SceneryBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllScenery();

    return Scaffold(
      appBar: AppBar(
        title: Text("scene"),
      ),
      body: StreamBuilder(
          stream: _bloc.allScenery,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text("エラーが発生しました");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget _buildList(AsyncSnapshot<List<ImageModel>> snapshot) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        ImageModel model = snapshot.data[index];
        return Image.network(model.imageUrl);
      },
      itemCount: snapshot.data.length,
    );
  }
}
