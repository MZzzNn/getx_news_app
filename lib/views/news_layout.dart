import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout>
    with SingleTickerProviderStateMixin {
  NewsController controller = Get.find();

  late AnimationController animationController;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<NewsController>(
      initState: (_) {},
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.titles[controller.currentIndex.value].tr),
            actions: [
              IconButton(
                icon: Icon(logic.isDark ? FontAwesomeIcons.moon : FontAwesomeIcons.solidMoon),
                onPressed: () {
                  logic.changeAppMode();
                  if (animationController.status == AnimationStatus.forward ||
                      animationController.status == AnimationStatus.completed) {
                    animationController.reverse().then(
                        (value) => animationController.forward());
                  } else {
                    animationController.forward();
                  }
                },
              ),
              IconButton(
                onPressed: () {
                  /// TODO: before
                  // showModalBottomSheet<void>(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return
                  //   },
                  // );

                  /// TODO: AFTER
                  Get.bottomSheet(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                          child: Column(
                            children: [
                              Text(
                                'Choose your language'.tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25),
                              ),
                              const SizedBox(height: 16.0),
                              // language selection
                              Expanded(
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: logic.languages.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: logic.languages[index] == logic.currentLanguage ?
                                        const Icon(Icons.check_box, color: Colors.green) :
                                        const Icon(Icons.check_box_outline_blank, color: Colors.green),
                                        title: Text(
                                          logic.languages[index].tr,
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        onTap: ()=>logic.changeLanguage(index),
                                      );
                                    }),
                              ),

                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                  );

                },
                icon: const Icon(FontAwesomeIcons.gear),
              )
            ],
          ),
          body: CircularRevealAnimation(
              animation: animation,
              centerAlignment: Alignment.topRight,
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child: controller.screens[controller.currentIndex.value],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //  navigateTo(context,SearchScreen());
            },
            child: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeScreen,
            currentIndex: controller.currentIndex.value,
            items:   [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.business),
                  label: 'Business'.tr,
                  backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.sports),
                label: 'Sports'.tr,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.devices_other),
                label: 'Technology'.tr,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.nature_people),
                label: 'Science'.tr,
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
            type: BottomNavigationBarType.shifting,
          ),
        );
      },
    );
  }
}
