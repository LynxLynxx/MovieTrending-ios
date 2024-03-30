//
//  APICaller.swift
//  MovieTrending
//
//  Created by Ryszard Schossler on 28/03/2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}


public class APICaller {
    
    static func getTrendingMovies(
        compilationHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void
    )  {
        let urlString = NetworkConstant.shared.serverAddress + "/trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        print(urlString)
        guard let url = URL(string: urlString) else {
            compilationHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil, let data = dataResponse, let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                compilationHandler(.success(resultData))
            }else {
                
                compilationHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
