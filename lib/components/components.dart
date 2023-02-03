import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colors.dart';
import '../utils/text.dart';
import 'bottomsheet.dart';

void showMyBottomSheet(BuildContext context, String title, String description,
    imageUrl, targetUrl) {
  showBottomSheet(
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
            targetUrl: targetUrl,
            imageUrl: imageUrl,
            title: title,
            description: description);
      });
}

_launchUrl(String targetUrl) async {
  final url = Uri.parse(targetUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Colud not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageUrl, targetUrl;
  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.targetUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
                text: description, size: 16, color: AppColors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Read Full Article',
                    style: GoogleFonts.lato(color: Colors.blue.shade400),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchUrl(targetUrl);
                      })
              ]),
            ),
          )
        ],
      ),
    );
  }
}
