//
//  Webservice.swift
//  FakeStoreMVVM
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case badRequest
    case decodingError
}


// webservice could be a protocol so that different url could be sent
// with different models
// the URL should not be hardcoded since the url could be sent from test or production
// environment

class Webservice {
    
    func getProducts() async throws -> [Product]{
        
        // check for bad url
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            
            throw NetworkError.badURL
        }
        
        // get data and response
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // check reponse for bad response
        guard let httpResposne = response as? HTTPURLResponse,
                httpResposne.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        // if all good, then decode the data
        // prdoducts will be sent out which is an array of Products
        // as that is what is to be returned
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            
            throw NetworkError.decodingError
        }
        
        return products
        
    }
    
}
