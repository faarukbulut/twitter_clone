import 'package:flutter/material.dart';
import 'package:twitter_clone/views/home/tabbar_view.dart';

class HomeView extends StatefulWidget {
  final ScrollController scrollController;
  const HomeView({super.key, required this.scrollController});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final String _randomImage = "https://picsum.photos/200/300";
  final String _dummyTweet = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis sollicitudin tempus.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(),
      floatingActionButton: buildFloatingActionButon(),
    );
  }

  buildListView() {
    return ListView.builder(
      itemCount: 10,
      controller: widget.scrollController,
      itemBuilder: (context, i){
        return buildListViewCard();
      },
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

  buildFloatingActionButon() {
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: (){},
      child: const Icon(Icons.adb, color: Colors.white),
    );
  }
}

