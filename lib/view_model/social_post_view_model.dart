import 'package:flutter/material.dart';
import 'package:tutorials/api/api_url.dart';
import 'package:tutorials/service/red_service.dart';
import '../model/social_post_model.dart';

class SocialPostViewModel extends ChangeNotifier {
  List<SocialPostModel> _socialPostData = [];
  List<SocialPostModel> get socialPostData => _socialPostData;
  String _apiMessage = "";
  String get apiMessage => _apiMessage;

  getSocialPostData() async {
    _apiMessage="Loading";
    var postResponse = await RedService.fetchData(
        modelFromJson: (json) => SocialPostModel.fromJson(json),
        url: ApiUrl.getSinglePost);
    if (postResponse is int) {
    _apiMessage=" failed to fetch data ";

      print(postResponse);
    } else {
    _apiMessage=" data fetched ";

      _socialPostData = postResponse.response;
      notifyListeners();
    }
    notifyListeners();
  }

  postSocialPost(body) async {
    _apiMessage="Loading";

    var postResponse = await RedService.postData(body: body, url: ApiUrl.createPost);
    if (postResponse is int) {
      print(postResponse);
    _apiMessage=" failed to post data ";

    } else {
    _apiMessage=" data posted ";

      notifyListeners();
    }
    notifyListeners();
  }

  updateSocialPost(body) async {
    _apiMessage="Loading";

    var postResponse =await RedService.putData(body: body, url: ApiUrl.updatePost);
    if (postResponse is int) {
      print(postResponse);
    _apiMessage=" failed to update data ";

    } else {
    _apiMessage=" data to update true ";

      notifyListeners();
    }
    notifyListeners();
  }

  deleteSocialPost() async {
    _apiMessage="Loading";

    var postResponse = await RedService.deleteData(url: ApiUrl.deletePost);
    if (postResponse is int) {
    _apiMessage=" failed to delete data ";

      print(postResponse);
    } else {
    _apiMessage="data deleted true ";

      notifyListeners();
    }
    notifyListeners();
  }
}
