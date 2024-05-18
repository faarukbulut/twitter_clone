import 'package:flutter/material.dart';
import 'package:twitter_clone/views/home_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({super.key});

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  final String _profilFotoUrl = "https://avatars.githubusercontent.com/u/72122797?v=4";
  bool isHeaderHide = false;
  double lastOffset = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init(){
    scrollController.addListener(() {
      if(scrollController.offset <= 0){
        isHeaderHide = false;
      }
      else if(scrollController.offset >= scrollController.position.maxScrollExtent){
        isHeaderHide = true;
      }
      else{
        isHeaderHide = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: buildTabbarItems(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              buildAppBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    HomeView(scrollController: scrollController,),
                    const Text('B'),
                    const Text('C'),
                    const Text('D'),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: buildFloatingActionButon(),

      ),
    );
  }

  buildAppBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isHeaderHide == true ? 0 : 50,
      child: AppBar(
        elevation: 0,
        title: buildAppBarItems(),
        centerTitle: false,
      ),
    );
  }

  buildAppBarItems(){
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(_profilFotoUrl)),
        Text('Home', style: titleTextStyle),
      ],
    );
  }

  buildTabbarItems() {
    return const TabBar(
      tabs: [
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.settings),),
      ],
    );
  }

  buildFloatingActionButon() {
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: (){},
      child: const Icon(Icons.adb, color: Colors.white),
    );
  }

}

TextStyle titleTextStyle = const TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);