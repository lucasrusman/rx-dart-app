import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart_app/pages/blog_post_list.dart';
import 'package:rxdart_app/viewmodels/blog_post_vm.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => BlogPostViewModel());
}

void main() {
  setupLocator();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const BlogPostList());
  }
}
