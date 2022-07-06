//
//  Movie.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

struct Movie {
    
    let title: String
    let description: String
    let posterImage: UIImage?
        
}

extension Movie {
    
    static let dummyMovies: [Movie] = [
        Movie(title: "The Godfather Part I", description: "Marlon Brando", posterImage: UIImage(named: "godfather")),
        Movie(title: "The Godfather Part II", description: "Al Pacino", posterImage: UIImage(named: "godfather2")),
        Movie(title: "American Beauty", description: "Kevin Spacey", posterImage: UIImage(named: "americanbeauty")),
        Movie(title: "American History X", description: "Edward Norton, Edward Furlong", posterImage: UIImage(named: "historyx")),
        Movie(title: "The Shining", description: "Jack Nicholson", posterImage: UIImage(named: "shining")),
        Movie(title: "The Departed", description: "Leonardo DiCaprio, Matt Damon", posterImage: UIImage(named: "departed")),
        Movie(title: "The Dark Knight", description: "Christian Bale, Heath Ledger", posterImage: UIImage(named: "darkknight")),
        Movie(title: "Interstellar", description: "Matthew McConaughey, Anne Hathaway", posterImage: UIImage(named: "interstellar")),
        Movie(title: "The Matrix", description: "Keanu Reeves, Laurence Fishborne", posterImage: UIImage(named: "matrix")),
        Movie(title: "Star Wars Episode V: Empire Strikes Back", description: "Harrison Ford, Mark Hamill", posterImage: UIImage(named: "starwarsv")),
        Movie(title: "The Avengers: Infinity War", description: "Robert Downey Jr., Chris Hemsworth", posterImage: UIImage(named: "avengers")),
        Movie(title: "Fight Club", description: "Brad Pitt", posterImage: UIImage(named: "fightclub"))
    ]
    
}
