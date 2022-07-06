//
//  MovieGridCollectionViewCell.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieLayoutGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!

    func setup(with movie: Movie) {
        posterImageView.image = movie.posterImage
        
    }

}
