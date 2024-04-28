class BusinessRoomModel {
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

  BusinessRoomModel({
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

  factory BusinessRoomModel.fromJson(Map<String, dynamic> json) {
    print('~BusinessRoomModel ${json.toString()}');
    List<PostImage> postImages = (json['postImages'] as List).map((imageJson) => PostImage.fromJson(imageJson)).toList();

    return BusinessRoomModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      rooms: json['rooms'] ?? 0,
      area: json['area'] ?? 0.0,
      price: json['price'] ?? 0.0,
      address: json['address'] ?? "",
      postImages: postImages,
      user: json['user'] ?? "",
      postTypes: List<String>.from(json['postTypes']),
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
