import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/ui/movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    'Titanic',
    'Blade Runner',
    'Rambo',
    'The Avengers',
    'Avatar',
    'I Am Legend',
    '300',
    'The Wolf of Wall Street',
    'Interestellar',
    'Game of Thrones',
    'Vikings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                movieCard(movieList[index], context),
                Positioned(
                  top: 7.5,
                  left: 10,
                  child: movieImage(movieList[index].poster),
                ),
              ],
            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.only(left: 60),
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            child: Card(
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 45.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'Rating: ${movie.imdbRating} / 10',
                            style: mainTextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Released: ${movie.released}',
                            style: mainTextStyle(),
                          ),
                          Text(
                            movie.runtime,
                            style: mainTextStyle(),
                          ),
                          Text(
                            movie.rated,
                            style: mainTextStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieListViewDetails(
                        movieName: movie.title,
                        movie: movie,
                      )));
        });
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ??
              'https://img.freepik.com/vector-gratis/pagina-error-404-no-encontrada_41910-364.jpg?size=626&ext=jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//New route

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$movieName'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: ListView(
          children: [
            MovieDetailsThumbnail(thumbnail: movie.images[0]),
            MovieDetailsHeaderWithPoster(movie: movie),
            HorizontalLine(),
            MovieDetailsCast(movie: movie),
            HorizontalLine(),
            MovieDetailsExtraPosters(
              posters: movie.images,
            ),
          ],
        ));
  }
}
