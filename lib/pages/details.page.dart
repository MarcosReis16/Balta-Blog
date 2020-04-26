import 'package:balta_blog/repositories/post.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DetailsPage extends StatelessWidget {
  final String tag;
  final repository = new PostRepository();

  DetailsPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Post"),
      ),
      body: FutureBuilder(
        future: repository.getPostBody(tag),
        builder: (ctx, snp){
          if(snp.hasData){
            String data = snp.data;
            return Markdown(
              data: data,
              styleSheet: MarkdownStyleSheet(
                h2: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22,
                ),
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}