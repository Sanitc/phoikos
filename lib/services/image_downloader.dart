import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadFirebaseStorageImage extends StatelessWidget {
  LoadFirebaseStorageImage(
      this.imageName, this.heightImage, this.widthImage, this.photoType);

  final String imageName;
  final String photoType; //photo d'un article, photo dans catégorie etc.
  final double heightImage;
  final double widthImage;

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Image Loading code goes here
      child: FutureBuilder(
        future: loadImage(context, imageName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              photoType == "article")
            return Container(
              height: 200,
              width: 300,
              child: snapshot.data != null
                  ? Image.network(snapshot.data, fit: BoxFit.fitWidth)
                  : Container(),
            );
          if (snapshot.connectionState == ConnectionState.done &&
              photoType == "categorie")
            return Container(
              height: heightImage, //200,
              width: widthImage, //300,
              child: snapshot.data != null
                  ? Image.network(snapshot.data, fit: BoxFit.fitWidth)
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
