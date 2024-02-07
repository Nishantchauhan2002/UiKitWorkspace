//
//  DetailViewModel.swift
//  MovieTrending
//
//  Created by Nishant Chauhan on 01/02/24.
//

import Foundation

class DetailMovieViewModel{

    var movie:Movie

    var movieImage:URL?
    var movieTitle:String
    var movieDescription:String
    var movieId:Int

    init(movie: Movie) {
        self.movie = movie

        self.movieId=movie.id
        self.movieTitle=movie.title ?? movie.name ?? ""
        self.movieDescription=movie.overview
        self.movieImage = makeImageUrl(movie.backdropPath )
    }
    private func makeImageUrl(_ imageCode:String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.serverImageAddress)\(imageCode)")
    }
}
