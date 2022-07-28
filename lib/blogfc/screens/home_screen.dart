import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import '../config.dart';
import '../helpers/wordpress.dart';
import '../helpers/search.dart';
import '../widgets/focuschronicle_appbar.dart';
import '../models/category_model.dart';
import '../widgets/loading.dart';
import '../widgets/focus_news_drawer.dart';
import 'single_category_slider_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static _HomeScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeScreenState>();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchDemoSearchDelegate _searchDelegate = SearchDemoSearchDelegate();
  bool isLoading = true;
  List<CategoryModel> categories = [];
  CategoryModel homePageCategory;

  @override
  void initState() {
    super.initState();

    /// load list of categories
    _loadData();

    /// add ad-space overlay after build
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     if (Config.facebookAdOverlay == null) {
    //       Config.facebookAdOverlay = addAdWidget(context: context);
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: Colors.grey.shade200,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    /// show loading message
    if (isLoading) {
      return Scaffold(appBar: DecoNewsAppBar(), body: Loading());
    }

    ///show single category if this setting is set
    if (Config.homePageCategory != null && homePageCategory != null)
      return Scaffold(
        //drawer: DecoNewsDrawer(),
        appBar: DecoNewsAppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await showSearch<int>(
                    context: context, delegate: _searchDelegate);
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                // color: Color(0xFFaf8521),
              ),
            )
          ],
        ),
        body: SingleCategorySliderScreen(homePageCategory),
      );

    /// show tabs
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        //drawer: DecoNewsDrawer(),
        appBar: DecoNewsAppBar(
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            //labelColor: isDark ? Colors.white : Color(0xFFFFFFFF),
            indicatorColor: isDark ? Colors.white : Color(0xFF1B1E28),
            tabs:
                categories.map((category) => Tab(text: category.name)).toList(),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await showSearch<int>(
                    context: context, delegate: _searchDelegate);
              },
              icon: Icon(
                Icons.search,
                // 0xFFaf8521
                color: Colors.white,
                //color: Color(0xFFaf8521),
              ),
            )
          ],
        ),
        body: TabBarView(
            children: categories
                .map((category) => SingleCategorySliderScreen(category))
                .toList()),
      ),
    );
  }

  /// load list of categories
  _loadData() async {
    Response response = await WordPress.fetchCategories();

    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          /// set list of categories
          categories = (json.decode(response.body) as List)
              .map((data) => new CategoryModel.fromJson(data))
              .toList();

          /// disable loading
          isLoading = false;

          /// set data for the homepage category in case this has been enabled
          if (Config.homePageCategory != null) {
            for (CategoryModel category in categories) {
              if (category.id == Config.homePageCategory) {
                homePageCategory = category;
                break;
              }
            }
          }
        });
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
