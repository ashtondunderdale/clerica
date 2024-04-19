import 'package:flutter/material.dart';

import '../../constants.dart';

class CardSearchBar extends StatefulWidget {
  const CardSearchBar({super.key, required this.onSearch});

  final Function(String) onSearch;

  @override
  State<CardSearchBar> createState() => _CardSearchBarState();
}

class _CardSearchBarState extends State<CardSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
    width: 200,
    height: actionBarHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
    ),
    child: _buildSearchBox(),
  );

  Widget _buildSearchBox() => SizedBox(
    height: 40,
    child: Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: lightGrey,
      ),
      child: TextField(
        onChanged: (value) {
          widget.onSearch(value);
        },
        controller: searchController,
        cursorColor: darkGrey,
        style: TextStyle(
          color: darkGrey,
          fontSize: smallTextFontSize,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: primaryPaddingValue),
          hintText: "Search...",
          border: InputBorder.none,
        ),
      ),
    ),
  );
}


