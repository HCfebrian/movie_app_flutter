import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/core/value/colors.dart';
import 'package:movie_app_flutter/core/value/style.dart';
import 'package:movie_app_flutter/domain/entity/movie_entity.dart';
import 'package:movie_app_flutter/presentation/bloc/get_Image_screenshoot/get_image_bloc.dart';

import '../../dep_inject.dart';


class DetailScreen extends StatelessWidget {
  final MovieEntity movieData;

  DetailScreen({@required this.movieData});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom:
              mediaQuery.padding.bottom == 0 ? 16.0 : mediaQuery.padding.bottom,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                BackdropImage(movieData.backdropPath),
                _buildWidgetAppBar(mediaQuery, context),
                _buildWidgetFloatingActionButton(mediaQuery),
                _buildWidgetIconBuyAndShare(mediaQuery),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildWidgetTitleMovie(context, movieData.title),
                  SizedBox(height: 4.0),
                  SizedBox(height: 16.0),
                  _buildWidgetRating(context, movieData.voteAverage.toString()),
                  SizedBox(height: 16.0),
                  _buildWidgetShortDescriptionMovie(context, movieData),
                  SizedBox(height: 16.0),
                  _buildWidgetSynopsisMovie(context, movieData.overview),
                  SizedBox(height: 16.0),
                  _buildWidgetScreenshots(
                      mediaQuery, context, movieData.id.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
//  return Text(movieData.title);
  }

  Widget _buildWidgetAppBar(MediaQueryData mediaQuery, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top == 0 ? 16.0 : mediaQuery.padding.top + 8.0,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/logo-fox-movie.png',
              height: 50,
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetFloatingActionButton(MediaQueryData mediaQuery) {
    return Column(
      children: <Widget>[
        SizedBox(height: mediaQuery.size.height / 2 - 60),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              // TODO: do something in here
            },
            child: Icon(
              Icons.play_arrow,
              color: AppColors.secondaryElement,
              size: 32.0,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetIconBuyAndShare(MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: mediaQuery.size.height / 2 - 40,
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.add),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetTitleMovie(BuildContext context, String title) {
    return Center(
      child: Text(
        title,
        style: AppStyle.textBlackSemiBold22,
      ),
    );
  }

  Widget _buildWidgetRating(BuildContext context, String rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          color: AppColors.secondaryElement,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          rating,
          style: AppStyle.textBlackBold16,
        )
      ],
    );
  }

  Widget _buildWidgetShortDescriptionMovie(
      BuildContext context, MovieEntity movieData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: 'Popularity\n', style: AppStyle.textBlackBold11),
                TextSpan(
                    text: movieData.popularity.toString(),
                    style: AppStyle.textBlackBold14),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: 'Year\n', style: AppStyle.textBlackBold11),
                TextSpan(
                    text: movieData.releaseDate,
                    style: AppStyle.textBlackBold14),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: 'Language\n', style: AppStyle.textBlackBold11),
                TextSpan(
                    text: movieData.originalLanguage.toString().toUpperCase(),
                    style: AppStyle.textBlackBold14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetSynopsisMovie(BuildContext context, String synopsis) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Text(
          synopsis,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildWidgetScreenshots(
      MediaQueryData mediaQuery, BuildContext context, String id) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('Screenshots', style: AppStyle.textBlackBold14),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        BlocProvider<GetImageBloc>(
          create: (BuildContext context) => sl<GetImageBloc>(),
          child: ScreenshotListView(id: id),
        ),
      ],
    );
  }
}

class ScreenshotListView extends StatelessWidget {
  final id;

  const ScreenshotListView({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetImageBloc>(context).add(GetImage(id: id));
    return BlocBuilder<GetImageBloc, GetImageState>(
      builder: (context, GetImageState state) {
        if (state is GetImageLoading) {
          return Text("loading");
        }
        if (state is GetImageError) {
          return Text(state.msg);
        }
        if (state is GetImageLoaded) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500" +
                          state.listMovie[index].filePath,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

class BackdropImage extends StatelessWidget {
  final String backdropPath;

  BackdropImage(this.backdropPath);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ClipPath(
      child: Image.network(
        "https://image.tmdb.org/t/p/w500" + backdropPath,
        height: mediaQuery.size.height / 2,
        width: mediaQuery.size.width,
        fit: BoxFit.cover,
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 70.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 70.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 70.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
