class Book {
  String? id;
  String? bookImage;
  String? bookName;
  String? bookPath;
  int? bookPrice;

  Book({this.id, this.bookImage, this.bookName, this.bookPath, this.bookPrice});

  Book.fromJson(Map<dynamic, dynamic> json, dynamic idKey) {
    id = idKey;
    bookImage = json['bookImage'];
    bookName = json['bookName'];
    bookPath = json['bookPath'];
    bookPrice = json['bookPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookImage'] = this.bookImage;
    data['bookName'] = this.bookName;
    data['bookPath'] = this.bookPath;
    data['bookPrice'] = this.bookPrice;
    return data;
  }
}
