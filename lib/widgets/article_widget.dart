import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rest_api/models/article_model.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.article}) : super(key: key);
 
  final Articles article;

  @override
  Widget build(BuildContext context) {
        final publishedAt = article.publishedAt!.split('T')[0];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            backgroundImage: article.imageUrl != null ? NetworkImage(article.imageUrl!) : null,
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title!,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
                const SizedBox(
                  height: 12,
                ),
                Text(article.author,
                style: const TextStyle(
                  color: Colors.grey
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(article.source.name ?? '',
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),

                    const Spacer(),
                    const Icon(
                      Icons.calendar_today_sharp,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(publishedAt ,
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
