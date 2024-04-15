import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery/services/index.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List images = [];
  @override
  void initState() {
    _getImages();
    super.initState();
  }

  _getImages() async {
    final imageList = await imageService.getImages();
    setState(() {
      images = imageList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Gallery"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount:
                    (MediaQuery.of(context).size.width / 200).floor()),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/image-details",
                      arguments: {"image": images[index]});
                },
                child: SizedBox(
                  width: 300,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: "image-${images[index].id}",
                            child: Image.network(
                              images[index].largeImageURL,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  size: 18,
                                ),
                                const Text(" : "),
                                Text(
                                  "${images[index].views}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.thumb_up_sharp,
                                  size: 18,
                                ),
                                const Text(" : "),
                                Text(
                                  "${images[index].likes}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
