import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/get_top_rated/get_top_rated_movie_bloc.dart';

class FeaturedBanner extends StatelessWidget {

  const FeaturedBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetTopRatedMovieBloc>(context).add(GetTopRatedMovie());
    return BlocBuilder<GetTopRatedMovieBloc, GetTopRatedMovieState>(
      builder: (BuildContext context, GetTopRatedMovieState state) {
        if (state is TopRatedMovieLoading) {
          return Container(height: 200,child: Center(child: CircularProgressIndicator()));
        }
        if (state is TopRatedMovieError) {
          return Center(child: Text(state.msg));
        }
        if (state is TopRatedMovieLoaded) {
          return Container(
            height:250,
            child: PageView.builder(
              itemCount: state.listMovie.length,
              itemBuilder: (ctx, id) {
                return Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),

                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500" +
                                state.listMovie[id].backdropPath,
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
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Colors.black45,
                          ),
                          child: Text(
                            "${state.listMovie[id].title}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Container(color: Colors.white,);
      },
    );
  }
}
