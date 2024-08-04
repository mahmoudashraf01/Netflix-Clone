import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/widgets/custom_carousel.dart';
import 'package:netflix_clone/widgets/upcoming_movie_card_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.topRatedShows,
    required this.nowPlaying,
    required this.upcomingFuture,
  });

  final Future<TvSeriesModel> topRatedShows;
  final Future<MovieModel> nowPlaying;
  final Future<MovieModel> upcomingFuture;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<TvSeriesModel>(
            future: topRatedShows,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomCarouselSlider(
                  data: snapshot.data!,
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CutomMovieTitle(
            future: nowPlaying,
            title: 'Now Playing',
          ),
          const SizedBox(
            height: 20,
          ),
          CutomMovieTitle(
            future: upcomingFuture,
            title: 'Upcoming Movies',
          )
        ],
      ),
    );
  }
}

class CutomMovieTitle extends StatelessWidget {
  const CutomMovieTitle({
    super.key,
    required this.future,
    required this.title,
  });

  final Future<MovieModel> future;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: UpcomingMovieCard(
        future: future,
        headlineText: title,
      ),
    );
  }
}
