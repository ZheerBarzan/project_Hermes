import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    Typography typography = FluentTheme.of(context).typography;
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
              ),
              child: Text(
                "Elon musk is a shmuck",
                style: typography.bodyLarge?.apply(fontSizeFactor: 0.8),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "bloomberg -2hours ago",
                    style: typography.bodyLarge?.apply(fontSizeFactor: 0.6),
                  ),
                ),
                DropDownButton(
                  title: const Icon(FluentIcons.share),
                  items: [
                    MenuFlyoutItem(
                      text: const Text("Open in browser"),
                      leading: const Icon(FluentIcons.edge_logo),
                      onPressed: () {
                        //launchUrl('http://google.com');
                      },
                    ),
                    MenuFlyoutItem(
                      text: const Text("Send"),
                      leading: const Icon(FluentIcons.send),
                      onPressed: () {
                        //launchUrl('http://google.com');
                      },
                    ),
                    MenuFlyoutItem(
                      text: const Text("Copy URL"),
                      leading: const Icon(FluentIcons.copy),
                      onPressed: () {
                        //launchUrl('http://google.com');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
