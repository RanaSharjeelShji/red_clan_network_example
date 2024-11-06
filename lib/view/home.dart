import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials/view_model/social_post_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Red clan network"),
      ),
      body: Consumer<SocialPostViewModel>(
        builder: (context, socialPostViewModel, child) {
          return Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await socialPostViewModel.getSocialPostData();
                  },
                  child: const Text("Get Data From API"),
                ),
                socialPostViewModel.socialPostData.isEmpty
                    ? const SizedBox()
                    : ListTile(
                        title: Text(socialPostViewModel.socialPostData[0].title),
                      ),
                ElevatedButton(
                  onPressed: () async {
                    var body = {
                      "title": 'foo',
                      "body": 'bar',
                      "userId": 1,
                    };
                    await socialPostViewModel.postSocialPost(body);
                  },
                  child: const Text("Post Data to API"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await socialPostViewModel.deleteSocialPost();
                  },
                  child: const Text("Delete Data from API"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var body = {
                      "title": 'foo',
                      "body": 'bar',
                      "userId": 1,
                      "id": 1,
                    };
                    await socialPostViewModel.updateSocialPost(body);
                  },
                  child: const Text("Update Data in API"),
                ),
                Text(socialPostViewModel.apiMessage),
              ],
            ),
          );
        },
      ),
    );
  }
}
