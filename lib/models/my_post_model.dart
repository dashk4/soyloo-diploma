class MyPostModel {
  final String id;
  final String title;
  final String description;
  final int rooms;
  final double area;
  final double price;
  final String address;
  final List<PostImage> postImages;
  final String user;
  final List<String> postTypes;

  MyPostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rooms,
    required this.area,
    required this.price,
    required this.address,
    required this.postImages,
    required this.user,
    required this.postTypes,
  });

  factory MyPostModel.fromJson(Map<String, dynamic> json) {
    return MyPostModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      rooms: json['rooms'] ?? 0,
      area: json['area'] ?? 0.0,
      price: json['price'] ?? 0.0,
      address: json['address'] ?? "",
      user: json['user'] ?? "",
      postTypes: json['postTypes'] != null ? List<String>.from(json['postTypes']) : [],
      postImages: json['postImages'] != null ? (json['postImages'] as List).map((imageJson) => PostImage.fromJson(imageJson)).toList() : [],
    );
  }
}

class PostImage {
  final int id;
  final String image;
  final bool poster;

  PostImage({
    required this.id,
    required this.image,
    required this.poster,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) {
    return PostImage(
      id: json['id'],
      image: json['image'],
      poster: json['poster'],
    );
  }
}
