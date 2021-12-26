//
//  NetworkService.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch  {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
    
    
}
