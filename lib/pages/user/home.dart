import 'package:flutter/material.dart';
import 'package:gym/backend/backend.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Backend obj = Provider.of<Backend>(context);

    return Scaffold(
      body: Stack(
        children: [
          obj.pages[obj.currentIndex],
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Stack(
                children: [
                  Positioned(
                    left: 130,
                    top: 36,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.032,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            obj.togglePage(0);
                            obj.updatePage(1);
                          },
                          child: Center(
                              child: Image.asset(
                            (obj.currentIndex == 0)
                                ? "assets/dumbbell fill.png"
                                : "assets/dumbbell.png",
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 40,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () => obj.togglePage(1),
                          child: Center(
                            child: Icon(
                              (obj.currentIndex == 1)
                                  ? Icons.person
                                  : Icons.person_outline,
                              size: 40,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
