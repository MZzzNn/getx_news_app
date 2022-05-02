import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import '../utils/widgets/components.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (logic) {
        return ConditionalBuilder(
          condition: logic.businessPosts.isNotEmpty,
          builder: (context) {
            return  ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildArticleItem(data: logic.businessPosts[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: logic.businessPosts.length,
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

