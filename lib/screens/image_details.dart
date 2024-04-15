import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery/services/index.dart';

class ImageDetailsScreen extends StatefulWidget {
  const ImageDetailsScreen({super.key});

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
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
    Map image = {};
    image = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Gallery"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
      body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: "image-${image["image"].id}",
                    child: Image.network(
                      image["image"].largeImageURL,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          size: 24,
                          color: Colors.white,
                        ),
                        const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white),),
                        Text(
                          "${image["image"].views}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.thumb_up_sharp,
                          size: 24,
                          color: Colors.white,
                        ),
                        const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white),),
                        Text(
                          "${image["image"].likes}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_downward_sharp,
                          size: 24,
                          color: Colors.white,
                        ),
                        const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white),),
                        Text(
                          "${image["image"].downloads}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.white,
                        ),
                        const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white),),
                        Text(
                          "${image["image"].user}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
