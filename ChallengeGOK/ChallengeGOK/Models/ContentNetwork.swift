//
//  ContentNetwork.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import Foundation
import UIKit

class ContentNetwork {
    
    private let base = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
    
    
    func requestContent(completion: @escaping(Result<Content, Error>) -> Void) {
        guard let url = URL(string: base) else{
            let error = NSError(domain: "Não foi possível converter a string para url", code: 0, userInfo: nil); completion(.failure(error))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) {  (data, response, error) in
            do {
                guard let data = data, error == nil, response != nil else {
                    completion(.failure(error!))
                    return
                }
                print(data)
                let responseJson = try JSONSerialization.jsonObject(with: data, options: [])
                print(responseJson)
                
                guard let content = try? JSONDecoder().decode(Content.self, from: data) else {
                    let error = NSError(domain: "Não foi possível decodificar o json para o Content", code: 0, userInfo: nil)
                    print(data)
                    completion(.failure(error))
                    return
                }
                completion(.success(content))
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
                
}

