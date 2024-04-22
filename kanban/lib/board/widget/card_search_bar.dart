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
  Widget build(BuildContext context) => SizedBox(
    width: 500,
    height: 100,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSearchBox(),
      ],
    )
  );

  Widget _buildSearchBox() => Padding(
    padding: const EdgeInsets.only(top: primaryPaddingValue*4, left: primaryPaddingValue*16),
    child: Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: white,
        border: Border.all(color: mediumGrey)
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
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: primaryPaddingValue, vertical: 14), 
          hintText: "Search...",
          border: InputBorder.none,
        ),
      ),
    ),
  );
}


