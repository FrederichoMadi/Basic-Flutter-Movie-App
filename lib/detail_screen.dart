import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_data.dart';

class DetailScreen extends StatelessWidget {
  final MovieList movies;

  DetailScreen({this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 9, 28, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Detail Movie",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FavoriteButton(name: movies.title)
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 310,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(movies.poster),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white10, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.video_call_rounded,
                                  size: 24,
                                  color: Colors.white30,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Genre",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  movies.genre,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white10, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 24,
                                  color: Colors.white30,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Age",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  movies.age,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white10, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 24,
                                  color: Colors.white30,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Duration",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  movies.duration,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 8),
                child: Text(
                  movies.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Synopsis",
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range_rounded,
                                color: Colors.white60,
                              ),
                              SizedBox(width: 8),
                              Text(
                                movies.dateRelease,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        movies.overview,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final String name;

  FavoriteButton({this.name});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState(name: name);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  String name;
  bool isFav = false;

  _FavoriteButtonState({this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFav = !isFav;
            if (isFav) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$name add to favorite"),
                duration: Duration(seconds: 1),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$name remove from favorite"),
                duration: Duration(seconds: 1),
              ));
            }
          });
        },
        icon: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
