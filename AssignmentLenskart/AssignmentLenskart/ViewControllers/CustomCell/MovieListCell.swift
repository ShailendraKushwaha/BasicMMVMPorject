//
//  MovieListCell.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 28/02/22.
//

import Foundation
import UIKit

class MovieListCell : UITableViewCell {
    
    public static let reuseIdentifier = "MovieCell"
    
    private let movieThumbnail: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let movieName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "shdjfjsfdjsfsdfsdf"
        return label
    }()
    
    private lazy var favouriteButton : FavouriteButton  = {
        let button = FavouriteButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setButton(active: false)
        button.addTarget(self, action: #selector(self.likeThisMovie), for: .touchUpInside)
        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var movieListViewModel: MovieListCellViewModel? {
        didSet {
            self.imageView?.setImageViaURL(url: movieListViewModel?.image ?? "")
            self.movieName.text = movieListViewModel?.title
            self.favouriteButton.setButton(active: movieListViewModel?.isFavourite ?? false)
        }
    }
    
    private func setupView(){
        contentView.addSubview(movieThumbnail)
        contentView.addSubview(movieName)
        contentView.addSubview(favouriteButton)
        
        movieThumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieThumbnail.widthAnchor.constraint(equalToConstant: 90).isActive = true
        movieThumbnail.heightAnchor.constraint(equalToConstant: 90).isActive = true
        movieThumbnail.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        movieName.leadingAnchor.constraint(equalTo: movieThumbnail.trailingAnchor).isActive = true
        movieName.trailingAnchor.constraint(equalTo: favouriteButton.leadingAnchor).isActive = true
        movieName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        favouriteButton.heightAnchor.constraint(equalTo:contentView.heightAnchor).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    @objc private func likeThisMovie(){
        self.movieListViewModel?.likeThisMovie()
        guard let movieListViewModel = movieListViewModel else {
            return
        }

        if likesDatabase[movieListViewModel.id] == nil {
            self.favouriteButton.setButton(active: self.movieListViewModel?.isFavourite ?? false)
        }else {
            self.favouriteButton.setButton(active: likesDatabase[movieListViewModel.id] ?? false)
        }
        
    }
    
}
