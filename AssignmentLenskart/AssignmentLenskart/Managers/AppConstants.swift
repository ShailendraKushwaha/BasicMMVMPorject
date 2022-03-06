//
//  AppConstants.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 27/02/22.
//

import Foundation

struct APIEndpoint {
    
    public static func movieEnPoint(query:String,pageNum: Int) -> String {
        return "http://api.themoviedb.org/3/search/movie"
    }
}

struct APIParams {
    
    private static let API_KEY = "6cbb984b8529601ef3cb966cec90ccee"
    
    public static func getParamforMovies() -> Dictionary<String,String> {
        return ["api_key":self.API_KEY,"page":"1","query" :"a"]
    }
}
