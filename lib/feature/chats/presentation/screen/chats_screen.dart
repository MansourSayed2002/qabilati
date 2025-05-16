import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/feature/chats/presentation/widget/buttom_tab_bar_widget.dart';

import 'package:qabilati/feature/chats/presentation/widget/card_chats_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Widget> screen = [CustomBodyChats(), CustomBodyCalls()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 13.0.w, left: 13.0.w, right: 13.0.h),
        child: Column(
          children: [
            Row(
              children: [
                ButtomTabBarWidget(
                  index: 0,
                  currentIndex: currentIndex,
                  title: S.of(context).chats,
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                ButtomTabBarWidget(
                  index: 1,
                  currentIndex: currentIndex,
                  title: S.of(context).calls,
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
              ],
            ),
            Gap(10.0.h),
            Expanded(child: screen.elementAt(currentIndex)),
          ],
        ),
      ),
    );
  }
}

class CustomBodyChats extends StatelessWidget {
  const CustomBodyChats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      separatorBuilder: (context, index) => Gap(8.0.h),
      itemBuilder:
          (context, index) => CardChatsWidget(
            image: ImageApp.logo,
            title: "Ahmed",
            subtitle: "hello",
          ),
    );
  }
}

class CustomBodyCalls extends StatelessWidget {
  const CustomBodyCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Calls"));
  }
}
