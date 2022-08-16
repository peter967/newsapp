import 'package:flutter/material.dart';

Widget photoCheck(article, context) {
  if (article['urlToImage'] != null) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            '${article['urlToImage']}',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  } else {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/91287-newspaper.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
