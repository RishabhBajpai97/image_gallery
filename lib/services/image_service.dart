import "dart:convert";
import "package:http/http.dart" as http;
import "package:image_gallery/models/image_model.dart";

class ImageService {
  Future<List> getImages() async {
    final response = await http.get(Uri.parse(
      "https://pixabay.com/api/?key=43402795-7c2dbd109697e97bfb64a6dcf&q=yellow+flowers&image_type=photo&min_width=300&orientation=horizontal",
    ));
    final decodedResponse = json.decode(response.body);
    final List imageList = decodedResponse["hits"]
        .map(
          (image) => ImageModel(
            id: image["id"],
            previewURL: image["previewURL"],
            largeImageURL: image["largeImageURL"],
            likes: image["likes"],
            views: image["views"],
            downloads: image["downloads"],
            user: image["user"],
          ),
        )
        .toList();
    return imageList;
  }
}
