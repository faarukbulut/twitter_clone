import 'package:flutter/material.dart';
import 'package:twitter_clone/components/custom_refresh.dart';
import 'package:twitter_clone/model/trend_topic.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  bool isRefresh = false;

  final TrendTopic _topic = TrendTopic(
    hashtag: "#Champ",
    location: "Trending in Turkey",
    tweets: "16.8K Tweets"
  );


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator2(
      onRefresh: () async{
        setState(() {
          isRefresh = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          isRefresh = false;
        });
      },
      child: ListView(
        children: [
          const SizedBox(height: 8),
          buildDownIcon(),
          buildTrendTitle(context),
          buildTrendsListView()
        ],
      ),
    );
  }

  buildTrendsListView() {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, _) => const SizedBox(height:8),
      itemBuilder: (context, i){
        return Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.none)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 5,
                    children: [
                      Text(_topic.location, style: Theme.of(context).textTheme.labelMedium),
                      Text(_topic.hashtag, style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16)),
                      Text(_topic.tweets, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        );
      },
    );
  }

  buildTrendTitle(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        child: const Text('Trends For You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  buildDownIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isRefresh ? 60 : 30,
      child: isRefresh ? const Center(child: CircularProgressIndicator()) : const Icon(Icons.arrow_downward, color: Colors.grey)
    );
  }
}