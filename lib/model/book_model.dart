class BookModel {
  String? title;
  String? description;
  String? imageUrl;
  String? pageNo;
  String? pdfUrl;
  String? sectionId;
  String? titleLower;

  var createdAt;
  BookModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.pageNo,
      required this.pdfUrl,
      required this.createdAt,
      required this.titleLower,
      required this.sectionId});
  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['imagrUrl'];
    pageNo = json['pagrNo'];
    pdfUrl = json['pdfUrh'];
    sectionId = json['sectionId'];
    titleLower = json['titleLower'];

    createdAt = json['createdAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imagrUrl': imageUrl,
      'pagrNo': pageNo,
      'pdfUrh': pdfUrl,
      'sectionId': sectionId,
      'titleLower': titleLower,
      'createdAt': createdAt
    };
  }
}
