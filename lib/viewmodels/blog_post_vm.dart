import 'dart:async';

import 'package:rxdart_app/models/blog_post.dart';

class BlogPostViewModel {
  final StreamController<List<BlogPost>> _blogPostListCtrl =
      StreamController.broadcast();
  Stream<List<BlogPost>> get outBlogPostList => _blogPostListCtrl.stream;
  Sink<List<BlogPost>> get _inBlogPostList => _blogPostListCtrl.sink;
  late List<BlogPost> _blogPosts;

  BlogPostViewModel() {
    outBlogPostList.listen((data) {
      _blogPosts = data;
    });
    Future.delayed(const Duration(seconds: 3)).then((_) {
      _inBlogPostList.add([
        BlogPost(
            id: 1,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 2,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 3,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 4,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 5,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 6,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 7,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 8,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 9,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
        BlogPost(
            id: 10,
            title: 'test',
            content: 'LucasRusman',
            author: 'Lucas',
            publishDate: DateTime.now()),
      ]);
    });
  }
  void addBlogPost(BlogPost blogPost) {
    _blogPosts.add(blogPost);
    _inBlogPostList.add(_blogPosts);
  }

  void updateBlogPost(BlogPost blogPost) {
    final index =
        _blogPosts.indexOf(_blogPosts.where((i) => i.id == blogPost.id).first);
    _blogPosts[index] = blogPost;
    _inBlogPostList.add(_blogPosts);
  }

  void deleteBlogPost(int id) {
    _blogPosts.removeWhere((element) => element.id == id);
    _inBlogPostList.add(_blogPosts);
  }
}
