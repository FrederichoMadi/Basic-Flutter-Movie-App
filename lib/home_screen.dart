import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/detail_screen.dart';

import 'model/movie_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 9, 28, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Movies",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(90, 90, 120, 0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  margin: EdgeInsets.all(8),
                  child: TextField(
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search Movies...",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      helperMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(90, 90, 120, 0.5), width: 0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "Trending",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final MovieList trending = comingSoon[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(movies: trending)));
                        },
                        child: Card(
                          color: Color.fromRGBO(90, 90, 120, 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 4,
                          child: Container(
                            height: 100,
                            width: 125,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(trending.poster),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  trending.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  color: Colors.yellow,
                                  child: Text(
                                    trending.age,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      trending.duration,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '|',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        trending.genre,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: comingSoon.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Coming Soon",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final MovieList comSoon = listMovie[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(movies: comSoon)));
                        },
                        child: Card(
                          color: Color.fromRGBO(90, 90, 120, 0.5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: 100,
                            width: 125,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(comSoon.poster),
                                ),
                                Text(
                                  comSoon.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  color: Colors.yellow,
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                    comSoon.age,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      comSoon.duration,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '|',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        comSoon.genre,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: listMovie.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
