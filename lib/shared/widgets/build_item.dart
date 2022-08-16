import 'package:flutter/material.dart';
import '../../layout/cubit/News_cubit.dart';
import '../../modules/web_view/web_view_screen.dart';
import 'photo_check.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        NewsCubit.get(context).navigateTo(
          context,
          WebViewScreen(url: article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            photoCheck(article, context),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
