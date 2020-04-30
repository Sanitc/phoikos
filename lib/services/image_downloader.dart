import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadFirebaseStorageImage extends StatelessWidget {
  String _imageName = 'cactus-343955_1920.jpg';

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Image Loading code goes here
      child: FutureBuilder(
        future: loadImage(context, _imageName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width / 1.25,
              child: snapshot.data != null
                  ? Image.network(snapshot.data)
                  : Container(),
            );

          if (snapshot.connectionState == ConnectionState.waiting)
            return Container(
                height: MediaQuery.of(context).size.height / 1.25,
                width: MediaQuery.of(context).size.width / 1.25,
                child: CircularProgressIndicator());

          return Container();
        },
      ),
    );
  }
}
