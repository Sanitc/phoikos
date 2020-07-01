class Partner {
  String adress;
  String description;
  String logo;
  String name;
  String phone;
  String photo;
  String website;

  Partner(this.adress, this.description, this.logo, this.name, this.phone,
      this.photo, this.website); //, this.para_3

  factory Partner.fromJSON(Map<String, dynamic> json) {
    return Partner(
        json['adress'].toString(),
        json['description'].toString(),
        json['logo'].toString(),
        json['name'].toString(),
        json['phone'].toString(),
        json['photo'].toString(),
        json['website'].toString());
  }
}
