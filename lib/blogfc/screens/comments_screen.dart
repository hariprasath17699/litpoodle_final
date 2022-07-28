import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:litpoodle/components/colors.dart';
import '../helpers/focus_localizations.dart';
import '../helpers/wordpress.dart';
import '../models/comment_model.dart';
import '../widgets/comment.dart';
import '../widgets/focuschronicle_appbar.dart';
import '../widgets/loading.dart';
import '../widgets/loading_infinite.dart';
import '../widgets/no_data.dart';
import 'comments_add_screen.dart';

class CommentsScreen extends StatefulWidget {
  final int postID;

  CommentsScreen(this.postID);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<CommentModel> comments = [];
  bool isLoading = true;
  bool loadingMore = false;
  bool canLoadMore = true;
  int page = 1;

  void initState() {
    super.initState();

    /// load list of comments
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        title: Image.asset(
          'assets/icons/logo.png',
          fit: BoxFit.cover,
          height: 38,
        ),
        centerTitle: true,
      ),
      //appBar: DecoNewsAppBar(),
      body: _buildBody(),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          height: 55.0,
          margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsAddScreen(this.widget.postID),
            )),
            style: ElevatedButton.styleFrom(
              shadowColor: secondarybgcolor,
              primary: secondarycolor,
              padding: EdgeInsets.all(0),
              textStyle: TextStyle(
                color: isDark ? Colors.white : Color(0xFF1B1E28),
              ),
              //   primary: isDark ? Colors.white : Color(0xFF1B1E28), // background
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)),
            ),
            child: Text(DecoLocalizations.of(context)
                .localizedString("comments_write_a_comment")),
          ),
        ),
      ),
    );
  }

  // style: ElevatedButton.styleFrom(
  // padding: EdgeInsets.all(0),
  // textStyle: TextStyle(
  // color:  isDark ? Colors.white : Color(0xFF1B1E28),
  // ),
  // primary:  isDark ? Colors.white: Color(0xFF1B1E28), // background
  // shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(3.0)),
  // ),

  Widget _buildBody() {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    /// show loading message
    if (isLoading) {
      return Loading();
    }

    /// add pull to refresh
    return RefreshIndicator(
      onRefresh: () => _loadData(clear: true),
      color: Color(0xFF1B1E28),
      child: NotificationListener(
          onNotification: (ScrollNotification scroll) {
            bool shouldLoadMore =
                scroll.metrics.pixels == scroll.metrics.maxScrollExtent &&
                    !this.loadingMore &&
                    this.canLoadMore;

            if (shouldLoadMore) {
              _loadData();
              return true;
            }

            return false;
          },
          child: comments.length == 0
              ? NoData(DecoLocalizations.of(context)
                  .localizedString("comments_sorry_no_comments"))
              : SingleChildScrollView(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              DecoLocalizations.of(context)
                                  .localizedString("comments"),
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: isDark
                                      ? Colors.white
                                      : Color(0xFF1B1E28)),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: comments.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            /// loading at bottom of the list
                            if (index == comments.length) {
                              return LoadingInfinite(canLoadMore);
                            }

                            /// return comment widget
                            return Comment(comments[index]);
                          }),
                    ],
                  ))),
    );
  }

  /// load comments
  _loadData({clear = false}) async {
    if (page > 1) {
      setState(() {
        loadingMore = true;
      });
    }

    if (clear) {
      page = 1;
    }

    /// fetch comments
    Response response =
        await WordPress.fetchComments(this.widget.postID, page: page);

    if (response.statusCode == 200) {
      int totalComments = int.parse(response.headers['x-wp-total'].toString());

      if (mounted) {
        setState(() {
          /// on refreshing page need to clean up
          if (clear) {
            this.comments.clear();
          }

          /// append loaded comments to existing list
          (json.decode(response.body) as List)
              .map((data) => comments.add(new CommentModel.fromJson(data)))
              .toList();

          /// disable loading animations
          isLoading = false;
          loadingMore = false;

          /// check do we have more pages to load
          canLoadMore = comments.length < totalComments;

          /// increase page count
          page += 1;
        });
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
