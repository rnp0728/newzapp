import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/functions.dart';
import '../utils/colors.dart';

class SearchBar extends StatefulWidget {
  final String searchInCategory;
  static TextEditingController searchController =
      TextEditingController(text: '');
  const SearchBar({Key? key, required this.searchInCategory}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: SearchBar.searchController,
                      decoration: InputDecoration(
                          hintText: 'Search a Keyword or a Phrase',
                          hintStyle: GoogleFonts.lato(),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchNews(widget.searchInCategory);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.darkGrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
