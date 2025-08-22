//
//  Webservice.swift
//  FakeStoreMVPattern
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation


enum NetworkError: Error{
    
    case badURL
    case badRequest
}

class Webservice{
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else{
            
            throw NetworkError.badURL
        }
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let httpResponse = response as? HTTPURLResponse,
              
                httpResponse.statusCode == 200 else {
            
            throw NetworkError.badRequest
        }
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        
        return products
        
    }
    
}
