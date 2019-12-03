import 'package:alurabytebank/models/post.dart';
import 'package:alurabytebank/services/json_placeholder.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Posts';

class PostListView extends StatefulWidget {
  final List<Post> _postList = List();

  @override
  _PostListViewState createState() => _PostListViewState();


}

class _PostListViewState extends State<PostListView> {
  int _page = 0;

  final _postsPerPage = 10;
  final List<Post> postsPage = new List();

  @override
  Widget build(BuildContext context) {
    requestPosts().then((posts) => _loadPostList(posts));

    return Scaffold(
      body: ListView.builder(
//        itemCount: widget._postList.length,
//          final post = widget._postList[index];
        itemCount: postsPage.length,
        itemBuilder: (context, index) {
          final post = postsPage[index];
          return ItemPostView(post);
        },
      ),
      appBar: AppBar(
        title: Text(_tituloAppBar),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.white,),
            onPressed: () {_backPage();},
          ),
          IconButton(
            icon: Icon(Icons.navigate_next, color: Colors.white,),
            onPressed: (){_nextPage();},
          )
        ],
      ),
    );
  }

  void _loadPostList(List<Post> posts) {
    if(posts != null ){
        widget._postList.clear();
        widget._postList.addAll(posts);
        _updatePostsPage();
    }
  }

  void _updatePostsPage(){
    setState(() {
      postsPage.clear();
      postsPage.addAll(widget._postList.sublist(_page * _postsPerPage, (_page + 1) * _postsPerPage));
    });
  }

  void _backPage() {
    _page = _page > 0 ? _page - 1 : 0;
    _updatePostsPage();
  }

  void _nextPage() {
    _page = widget._postList.length > (_page+1) * _postsPerPage ? _page + 1: _page;
    _updatePostsPage();
  }
}

class ItemPostView extends StatelessWidget {
  final Post _post;

  ItemPostView(this._post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(_post.id.toString()),
        title: Text(_post.titulo),
        subtitle: Text(_post.corpo),
      ),
    );
  }
}

