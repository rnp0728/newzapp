import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';
import 'bottomsheet.dart';
import 'components.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, time, description, targetUrl;
  const NewsTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description,
      required this.targetUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, targetUrl);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModifiedText(text: title, size: 16, color: AppColors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    ModifiedText(
                        text: time, size: 12, color: AppColors.lightWhite)
                  ],
                )),
              ],
            ),
          ),
        ),
        const DividerWidget()
      ],
    );
  }
}
