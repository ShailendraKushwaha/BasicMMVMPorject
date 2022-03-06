//
//  MovieDetails.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 27/02/22.
//

import Foundation
import UIKit

class MovieDetailsVC: UIViewController {
    
    let movieThumbnail: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var favouriteButton : FavouriteButton  = {
        let button = FavouriteButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setButton(active: false)
        button.addTarget(self, action: #selector(self.likeThisMovie), for: .touchUpInside)
        return button
    }()
    
    var movieDetailsVM : MovieDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movieDetailsVM?.configureView(self)
    }
    
    private func setupView(){
        view.addSubview(movieThumbnail)
        view.addSubview(favouriteButton)
        
        movieThumbnail.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieThumbnail.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        movieThumbnail.heightAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        movieThumbnail.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        
        favouriteButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        favouriteButton.topAnchor.constraint(equalTo: movieThumbnail.bottomAnchor).isActive = true
    }
    
    @objc private func likeThisMovie(){
        self.movieDetailsVM?.likeThisMovie()
        self.favouriteButton.setButton(active: self.movieDetailsVM?.movie.favourite ?? false)
    }
}
