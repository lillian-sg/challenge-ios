//
//  ContentNetwork.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import Foundation
import UIKit

class ContentNetwork {
    
    let baseURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
    
    func requestContent(completion: @escaping(Result<Content, Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        GokLoad.shared.showLoad(true)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //GokLoad.shared.showLoad(false)
            do {
                guard let data = data, let _ = response, error == nil else {
                    completion(.failure(NSError()))
                    return
                    
                }
                
                print(data)
                let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                print(json)
                
                let content = try JSONDecoder().decode(Content.self, from: data)
                completion(.success(content))
                
            } catch {
                print("Error do network", error)
            }
        }.resume()
    }
}
