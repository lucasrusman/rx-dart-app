import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart_app/models/blog_post.dart';
import 'package:rxdart_app/pages/blog_post_modify.dart';
import 'package:rxdart_app/viewmodels/blog_post_vm.dart';

class BlogPostList extends StatelessWidget {
  const BlogPostList({super.key});

  // final vm = BlogPostViewModel();
  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Posts'),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 30,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlogPostModify()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: StreamBuilder<List<BlogPost>>(
            stream: _vm.outBlogPostList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final blogPosts = snapshot.data;
              return ListView.builder(
                itemCount: blogPosts!.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                BlogPostModify(blogPost: blogPost)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                blogPost.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                formatDate(blogPost.publishDate),
                                style: const TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
