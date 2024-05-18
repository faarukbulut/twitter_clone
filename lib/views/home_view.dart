import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final String _profilFotoUrl = "https://avatars.githubusercontent.com/u/72122797?v=4";
  final String _randomImage = "https://picsum.photos/200/300";
  final String _dummyTweet = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis sollicitudin tempus.";
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
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              buildAppBar(),
              buildTabbarItems(),
              buildListView(),
            ],
          ),
        ),
      ),
      floatingActionButton: buildFloatingActionButon(),
    );
  }

  buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        controller: scrollController,
        itemBuilder: (context, i){
          return buildListViewCard();
        },
      ),
    );
  }

  buildListViewCard(){
return Card(
  child: Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(_randomImage)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello", style: titleTextStyle),
              Wrap(
                runSpacing: 5,
                children: [
                  Text(_dummyTweet, style: TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 100,
                    child: Placeholder(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconLabelButton('1'),
                      buildIconLabelButton('1'),
                      buildIconLabelButton('1'),
                      buildIconLabelButton('1'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

  }

  buildIconLabelButton(String text) {
    return InkWell(
      onTap: (){},
      child: Wrap(
        spacing: 5,
        children: [
          const Icon(Icons.comment),
          Text(text)
        ],
      ),
    );
  }

  buildTabbarItems() {
    return const TabBar(
      tabs: [
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.dashboard),),
        Tab(icon: Icon(Icons.dashboard),),
      ],
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
