import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart_app/models/blog_post.dart';
import 'package:rxdart_app/viewmodels/blog_post_vm.dart';

class BlogPostModify extends StatelessWidget {
  final BlogPost? blogPost;

  bool get isEditing => blogPost != null;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  BlogPostModify({super.key, this.blogPost}) {
    if (isEditing) {
      _titleController.text = blogPost!.title;
      _contentController.text = blogPost!.content;
      _authorController.text = blogPost!.author;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? 'Edit blog post' : 'Create blog post'),
          elevation: 0.0,
          actions: <Widget>[
            isEditing
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _vm.deleteBlogPost(blogPost!.id);
                      Navigator.of(context).pop();
                    },
                  )
                : Container()
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              Container(
                height: 12,
              ),
              TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(hintText: 'Content')),
              Container(
                height: 12,
              ),
              TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(hintText: 'Author')),
              Container(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    onPressed: () {
                      final blogPost = BlogPost(
                          title: _titleController.text,
                          content: _contentController.text,
                          author: _authorController.text,
                          id: isEditing
                              ? this.blogPost!.id
                              : Random().nextInt(100000),
                          publishDate: DateTime.now());
                      if (isEditing) {
                        _vm.updateBlogPost(blogPost);
                      } else {
                        _vm.addBlogPost(blogPost);
                      }
                      Navigator.of(context).pop();
                    },
                    color: Theme.of(context).primaryColor,
                    child: const Text('Save',
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
        ));
  }
}
