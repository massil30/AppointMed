import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:responsivity/utils/theme_extention.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
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
                tabs: [
                  TabBarIcon(icon: Icons.home, selected: currentPage == 0),
                  TabBarIcon(icon: Icons.chat, selected: currentPage == 1),
                  TabBarIcon(icon: Icons.favorite, selected: currentPage == 2),
                  TabBarIcon(icon: Icons.person, selected: currentPage == 3),
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
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              4,
              (index) => InfiniteListPage(
                key: ValueKey('infinite_list_key#${index.toString()}'),
                controller: controller,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfiniteListPage extends StatelessWidget {
  final ScrollController controller;
  final Color color;

  const InfiniteListPage({
    Key? key,
    required this.controller,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          color: index.isEven ? color.withOpacity(0.3) : color,
          child: Center(child: Text("Item $index")),
        );
      },
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
