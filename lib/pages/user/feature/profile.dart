import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gym/backend/backend.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Backend obj = Provider.of<Backend>(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/user.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.53,
            width: double.infinity,
            color: Colors.transparent,
          ),
          Text(
            "Kabir Singh",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CarouselSlider(
              items: [
                for (int i = 0; i < obj.iconName.length; i++)
                  Card(
                    elevation: 20,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(33)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            obj.iconPath[i],
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: Colors.white,
                          ),
                          (obj.page == i)
                              ? AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      obj.iconName[i],
                                      textStyle: const TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                )
                              : const SizedBox(),
                          Text(
                            obj.discription[i],
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
              options: CarouselOptions(
                  initialPage: 1,
                  viewportFraction: 0.7,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: false,
                  onPageChanged: (index, val) {
                    obj.updatePage(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
