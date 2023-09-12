import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:project_hermes/model/article.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Typography typography = FluentTheme.of(context).typography;

    return HoverButton(
        onPressed: (() async {
          if (!await launchUrlString(article.url)) {
            log('couldnt lunch the URL${article.url}' as num);
          }
        }),
        cursor: SystemMouseCursors.click,
        builder: (context, states) {
          return Card(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
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
                        image: article.urlToImage ??
                            "https://via.placeholder.com/108"),
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
                      article.title,
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
                          article.captionText(),
                          style:
                              typography.bodyLarge?.apply(fontSizeFactor: 0.6),
                        ),
                      ),
                      DropDownButton(
                        title: const Icon(FluentIcons.share),
                        items: [
                          MenuFlyoutItem(
                            text: const Text("Open in browser"),
                            leading: const Icon(FluentIcons.edge_logo),
                            onPressed: () async {
                              if (!await launchUrlString(article.url)) {
                                log('couldnt lunch the URL${article.url}'
                                    as num);
                              }
                            },
                          ),
                          MenuFlyoutItem(
                            text: const Text("Send"),
                            leading: const Icon(FluentIcons.send),
                            onPressed: () {
                              Share.share(
                                  "check out this article ${article.url}");
                            },
                          ),
                          MenuFlyoutItem(
                            text: const Text("Copy URL"),
                            leading: const Icon(FluentIcons.copy),
                            onPressed: () {
                              FlutterClipboard.copy(article.url).then((value) =>
                                  showCopySnackBar(context, article.url));
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
        });
  }

  void showCopySnackBar(BuildContext context, String copiedText) {
    showSnackbar(
      context,
      InfoBar(
        title: const Text("copied text"),
        content: RichText(
          text: TextSpan(
              text: "copied",
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: copiedText,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                )
              ]),
        ),
      ),
    );
  }
}
