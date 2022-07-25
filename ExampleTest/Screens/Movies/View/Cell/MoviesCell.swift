//
//  MoviesCell.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import UIKit
import AlamofireImage

class MoviesCell: UITableViewCell {
  
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var headinglabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    

    func setCellWithValuesOf(list:ListingData) {
        
        cardView.layer.applySketchShadow()
        movieImage.layer.cornerRadius = 10
        movieImage.clipsToBounds = true

        
        
//      headinglabel
        headinglabel.text = list.original_title
    
//      imagview
        let imageUrl : String? = list.backdrop_path
        let backdropURL = moviesInstances.sharedInstance.imageBaseURL + (imageUrl ?? "")
        let url = URL(string: backdropURL ?? "")!
        movieImage.af.setImage(withURL: url)
        
        
        
    }

    
    

    
    
}







