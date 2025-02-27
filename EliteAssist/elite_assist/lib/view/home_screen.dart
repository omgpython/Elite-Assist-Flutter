import 'package:carousel_slider/carousel_slider.dart';
import 'package:elite_assist/controller/banner_controller.dart';
import 'package:elite_assist/controller/service_controller.dart';
import 'package:elite_assist/generated/fonts.dart';
import 'package:elite_assist/view/sub_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bannerController = Get.put(BannerController());
  final serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        ),
        title: Center(
          child: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.white,
              fontFamily: Fonts.BebasNeue,
            ),
          ),
        ),
      ),
      body: Obx(
        () => bannerController.isLoading.value &&
                serviceController.isLoading.value
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          autoPlayCurve: Curves.easeInOutBack,
                          onPageChanged: (index, reason) {
                            bannerController.currentIndex.value = index;
                          },
                        ),
                        items: bannerController.bannerModel!.banner.map(
                          (banner) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  banner.pic,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            bannerController.bannerModel!.banner.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              width: 30,
                              height: 5,
                              decoration: BoxDecoration(
                                color:
                                    bannerController.currentIndex.value == index
                                        ? Colors.black
                                        : Colors.grey,
                                borderRadius: index == 0
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      )
                                    : index ==
                                            bannerController.bannerModel!.banner
                                                    .length -
                                                1
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50),
                                          )
                                        : BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.BonaNovaSC,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All >',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.BonaNovaSC,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 150,
                        ),
                        itemBuilder: (context, index) {
                          var data = serviceController.model!.service[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => SubServiceScreen(
                                  id: data.id,
                                  name: data.sname,
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        data.pic,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 7,
                                      ),
                                      child: Text(
                                        data.sname,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: Fonts.Roboto,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
