import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials/view/home.dart';
import 'package:tutorials/view_model/social_post_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => SocialPostViewModel()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
