import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rest_api/models/article_model.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.article}) : super(key: key);
 
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('',
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
                overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 8,),
              ],
            )
          ),
        ],
      ),
    );
  }
}
