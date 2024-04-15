class ImageModel {
  final int? id;

  final int? views;

  final int? likes;

  final String? previewURL;

  final String? largeImageURL;
  final int? downloads;
  final String? user;
  ImageModel({
    this.id,
    this.views,
    this.likes,
    this.previewURL,
    this.largeImageURL,
    this.downloads,
    this.user,
  });
}
