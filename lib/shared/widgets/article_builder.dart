import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'build_item.dart';

Widget articleBuilder(list,context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildArticleItem(list[index],context);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 25,
              endIndent: 50,
              color: Colors.blueGrey,
            );
          },
          itemCount: list.length,
        );
      },
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
