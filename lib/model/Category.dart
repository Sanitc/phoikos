class Category {
  String id;
  String name;
  String image;
  String collection;

  Category(this.id, this.name, this.image, this.collection);

  factory Category.fromJSON(String id, Map<String, dynamic> json) {
    return Category(id, json['nom_categorie'].toString(),
        json['photo'].toString(), json['collection'].toString());
  }
}
