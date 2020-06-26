import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadFirebaseStorageImage extends StatelessWidget {
  LoadFirebaseStorageImage(
      this.imageName, this.heightImage, this.widthImage, this.photoType);

  final String imageName;
  final String photoType; //photo d'un article, photo dans catégorie etc.
  final double heightImage;
  final double widthImage;

  //snpashot de Storage à un instant T
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Future Builder créé avec le snapshot créé plus haut
      child: FutureBuilder(
        future: loadImage(context, imageName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              photoType == "article")
            return Container(
              height: 200,
              width: 300,
              child: snapshot.data != null
                  ? Image.network(snapshot.data,
                      fit: BoxFit.cover) //cover = fit la boite
                  : Container(),
            );
          if (snapshot.connectionState == ConnectionState.done &&
              photoType == "categorie")
            return Container(
              height: heightImage, //200,
              width: widthImage, //300,
              child: snapshot.data != null
                  ? Image.network(snapshot.data, fit: BoxFit.cover)
                  : Container(),
            );

          if (snapshot.connectionState == ConnectionState.done &&
              photoType == null)
            return Container(
              height: heightImage, //200,
              width: widthImage, //300,
              child: snapshot.data != null
                  ? Image.network(snapshot.data, fit: BoxFit.cover)
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
