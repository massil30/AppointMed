import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:responsivity/features/chat/chatPage.dart';
import 'package:responsivity/features/favorite/favoritepage.dart';
import 'package:responsivity/features/profile/profile.dart';
import 'package:responsivity/pages/homepage/homepage.dart';
import 'package:responsivity/utils/theme_extention.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  List<Widget> pages = [HomePage(), Chatpage(), FavorisPage(), PorfilePage()];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation?.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          clip: Clip.none,
          barColor: context.primary, // Selected bar color
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                controller: tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: context.primary, // Only selected bar color
                    width: 4,
                  ),
                  insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
                ),
                indicatorColor:
                    Colors.transparent, // Remove default indicator color
                indicatorWeight: 0, // Remove default indicator weight
                tabs: [
                  TabBarIcon(
                    icon: Icons.home_outlined,
                    selected: currentPage == 0,
                  ),
                  TabBarIcon(
                    icon: Icons.chat_outlined,
                    selected: currentPage == 1,
                  ),
                  TabBarIcon(
                    icon: Icons.favorite_outlined,
                    selected: currentPage == 2,
                  ),
                  TabBarIcon(
                    icon: Icons.person_outlined,
                    selected: currentPage == 3,
                  ),
                ],
              ),
            ],
          ),
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          respectSafeArea: true,

          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: pages,
          ),
        ),
      ),
    );
  }
}

class TabBarIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const TabBarIcon({super.key, required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    const Color selectedIconColor = Color(0xFF00278C);
    const Color unselectedIconColor = Colors.white;
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: Icon(
          icon,
          color: selected ? selectedIconColor : unselectedIconColor,
        ),
      ),
    );
  }
}
