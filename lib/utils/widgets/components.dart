import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/news_controller.dart';
import '../../models/news_model.dart';
import '../../routes_manager.dart';

class BuildArticleItem extends StatelessWidget {
  final ArticleData data;
  NewsController controller = Get.find();
  BuildArticleItem({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return InkWell(
      onTap:()=> Get.toNamed(Routes.webViewRoute, arguments: data.url),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (mediaQ.height) / 6.5,
              width: (mediaQ.width) / 2.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  data.urlToImage ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/images/no_image.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${data.title}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateTimeFormat.format(
                      controller.convertDate(data.publishedAt),
                      format: DateTimeFormats.american,
                    ),
                    style: const TextStyle(fontSize: 13.0, color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
