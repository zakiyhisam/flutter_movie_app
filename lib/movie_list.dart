import 'package:flutter/material.dart';
import 'package:movie_app/viewModel/movie_view_model.dart';
class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;
  MovieList({required this.movies});

  showAlertDialog(BuildContext context, MovieViewModel movie) {

  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("close"),
    onPressed: () {
    Navigator.pop(context);

    }
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    //title: Text(movie.title),
    content: 
    Container(
      height: 320,
      width: 350,
      child: Row(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.poster)
                ),
                borderRadius: BorderRadius.circular(6)
            ),
            width: 200,
            height: 300,
          ),
        SizedBox(width: 20,),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(movie.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text('released: ' + movie.yearReleased)
            ],
          ),
        )
      ],
    )),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          onTap: (){
          // show the dialog
          showAlertDialog(context, movie);

          },
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.poster)
                ),
                borderRadius: BorderRadius.circular(6)
            ),
            width: 50,
            height: 100,
          ),
          title: Text(movie.title),
        );
      },
    );
  }
}