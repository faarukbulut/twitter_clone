import 'package:flutter/material.dart';
import 'package:twitter_clone/views/home/home_view.dart';
import 'package:twitter_clone/views/home/search_view.dart';

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
  int currentIdx = 0;

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
      initialIndex: 0,
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
                    const SearchView(),
                    const Text('C'),
                    const Text('D'),
                  ],
                ),
              )
            ],
          ),
        ),
        
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(_profilFotoUrl)),
        const SizedBox(width:10),
        Expanded(child: buildCenterAppBar()),
        const SizedBox(width:10),
        const Icon(Icons.access_alarm, color: Colors.blue,)
      ],
    );
  }

  buildCenterAppBar(){
    if(currentIdx == 0){
      return Text('Home', style: titleTextStyle);
    }
    else if(currentIdx == 1){
      return TextField(
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: "Search Tweet",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
    }
    else{
      return Container();
    }
  }





  buildTabbarItems() {
    return TabBar(
      isScrollable: false,
      onTap: (index){
        setState(() {
          currentIdx = index;
        });
      },
      tabs: const [
        Tab(icon: Icon(Icons.home),),
        Tab(icon: Icon(Icons.search),),
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.settings),),
      ],
    );
  }



}

TextStyle titleTextStyle = const TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);