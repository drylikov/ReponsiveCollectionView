//
//  MovieListCollectionViewCell.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieLayoutListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    func setup(with movie: Movie) {
        posterImageView.image = movie.posterImage
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.description
    }

}
