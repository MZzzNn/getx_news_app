import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../controller/news_controller.dart';
import '../utils/widgets/components.dart';


class TechnologyView extends StatelessWidget {
  const TechnologyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (logic) {
        return ConditionalBuilder(
          condition: logic.technologyPosts.isNotEmpty,
          builder: (context) {
            return  ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildArticleItem(data: logic.technologyPosts[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: logic.technologyPosts.length,
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
