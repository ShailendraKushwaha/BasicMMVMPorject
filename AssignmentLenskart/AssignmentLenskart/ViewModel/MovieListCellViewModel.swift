//
//  MovieListCellViewModel.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 28/02/22.
//

import Foundation

struct MovieListViewModel {
    var movies: Observable<[MovieListCellViewModel]> = Observable([])
    
//    private func getMoviesList(){
//        
//        APIHandler.sharedInstance.getAPI(params: APIParams.getParamforMovies(), stringURL: APIEndpoint.movieEnPoint(query: "", pageNum: 1), onSuccess: {[weak self]dictionary in
//            DispatchQueue.main.async{
//                do {
//                    if let results = dictionary["results"] as? NSArray {
//                        let data = try JSONSerialization.data(withJSONObject: results, options: .fragmentsAllowed)
//                        let movies = try JSONDecoder().decode([Movie].self, from: data)
//                        self?.movieListViewModel.movies.value = self?.movies.compactMap({
//                            MovieListCellViewModel(id: String($0.id), title:$0.title,image:$0.getThumbnailAddress(),isFavourite:$0.favourite)
//                        })
//                       
//                    }
//                }
//                catch {
//                    //Show alert or error label on screen here
//                    print(error.localizedDescription)
//                }
//            }
//            
//        }, onFailure: {error in
//            print(error.localizedDescription)
//            
//        })
//    }
}

struct MovieListCellViewModel {
    var id: String
    var title: String
    var image:String
    var isFavourite:Bool
    
    public mutating func likeThisMovie(){
//        send this data to api or store to realm whatever
//        i am caching this to global likes dictionary in helpers.swift file
        self.isFavourite.toggle()
        likesDatabase[id] = self.isFavourite
    }
    
}
