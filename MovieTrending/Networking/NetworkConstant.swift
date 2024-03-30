//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Ryszard Schossler on 28/03/2024.
//

import Foundation


class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    
    private init() {
        
    }
    
    public var apiKey: String{
        get {
            return Secure.shared.apiKey
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
