class Article {
  //String id;
  String name;
  String image;
  String intro;
  String para_1;
  String para_2;
  //String para_3;

  Article(this.name, this.image, this.intro, this.para_1,
      this.para_2); //, this.para_3

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
        json['title'].toString(),
        json['photo'].toString(),
        json['intro'].toString(),
        json['para_1'].toString(),
        json['para_2'].toString());
  }
}
