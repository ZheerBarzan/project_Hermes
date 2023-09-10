import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Container(
              width: double.infinity,
              height: 180,
              color: material.Colors.grey.shade300,
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Icon(
                      material.Icons.image,
                      color: material.Colors.grey.shade600,
                    );
                  },
                  fit: BoxFit.cover,
                  image:
                      "https://www.pexels.com/photo/clouds-over-buildings-in-city-15114111"),
            ),
          ),
        ],
      ),
    );
  }
}
