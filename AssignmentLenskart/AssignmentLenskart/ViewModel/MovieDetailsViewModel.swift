//
//  MovieDetailsViewModel.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 28/02/22.
//

import Foundation
import UIKit

struct MovieDetailsViewModel {
   var movie : Movie
    var viewC : MovieDetailsVC?
    
    public mutating func configureView(_ vc:MovieDetailsVC){
        self.viewC = vc
        vc.setNavigationTitle(title: "<  " + movie.title)
        vc.movieThumbnail.setImageViaURL(url: movie.getThumbnailAddress())
        
         let id = String(movie.id)
            if likesDatabase[id] == nil {
                vc.favouriteButton.setButton(active:  false)
            }else {
                vc.favouriteButton.setButton(active: likesDatabase[id] ?? false)
            }
        
        
    }
    
    public mutating func likeThisMovie(){
        movie.favourite.toggle()
        likesDatabase[String(movie.id)] = movie.favourite
        viewC?.favouriteButton.setButton(active: movie.favourite)
    }
}
