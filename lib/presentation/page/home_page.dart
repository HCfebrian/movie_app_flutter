import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/core/value/style.dart';
import 'package:movie_app_flutter/presentation/bloc/get_popular/get_popular_movie_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_top_rated/get_top_rated_movie_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_upcoming/get_upcoming_movie_bloc.dart';
import 'package:movie_app_flutter/presentation/page/detail_page.dart';
import 'package:movie_app_flutter/presentation/widget/fetured_banner.dart';

import '../../dep_inject.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.black54,),
          title: Image.asset(
            "assets/logo-fox-movie.png",
            width: 90,
            height: 90,
          ),
          actions: <Widget>[Icon(Icons.search, color: Colors.black54,)],
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<GetUpcomingMovieBloc>(
                  create: (BuildContext context) => sl<GetUpcomingMovieBloc>()),
              BlocProvider<GetPopularMovieBloc>(
                  create: (BuildContext context) => sl<GetPopularMovieBloc>()),
              BlocProvider<GetTopRatedMovieBloc>(
                  create: (BuildContext context) => sl<GetTopRatedMovieBloc>()),
            ],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FeaturedBanner(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Popular",
                          style: AppStyle.textBlackBold16,
                        ),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                  PopularList(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Upcoming",
                            style: AppStyle.textBlackBold16,
                          ),
                          Icon(Icons.navigate_next)
                        ],
                      )),
                  UpcomingList()
                ],
              ),
            )));
  }
}

class PopularList extends StatelessWidget {
  const PopularList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPopularMovieBloc>(context).add(GetPopularMovie());
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: BlocBuilder<GetPopularMovieBloc, GetPopularMovieState>(
          builder: (BuildContext context, GetPopularMovieState state) {
        if (state is PopularMovieLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is PopularMovieError) {
          return Text(state.msg);
        }
        if (state is PopularMovieLoaded) {
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.listMovie.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movieData: state.listMovie[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500" +
                            state.listMovie[index].posterPath,
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container(
          color: Colors.white,
        );
      }),
    );
  }
}

class UpcomingList extends StatelessWidget {
  const UpcomingList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetUpcomingMovieBloc>(context).add(GetUpcomingMovie());
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: BlocBuilder<GetUpcomingMovieBloc, GetUpcomingMovieState>(
          builder: (BuildContext context, GetUpcomingMovieState state) {
        if (state is UpcomingMovieLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UpcomingMovieError) {
          return Center(child: Text(state.msg));
        }
        if (state is UpcomingMovieLoaded) {
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.listMovie.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movieData: state.listMovie[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500" +
                            state.listMovie[index].posterPath,
                        width: 100,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container(color: Colors.white);
      }),
    );
  }
}
