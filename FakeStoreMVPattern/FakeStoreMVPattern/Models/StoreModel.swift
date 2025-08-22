//
//  StoreModel.swift
//  FakeStoreMVPattern
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation

// The job of the store model is to direct the flow
// acts a middle man 


@MainActor
class StoreModel: ObservableObject {
    
    let webService: Webservice
    
    @Published var products: [Product] = []
    
    init(webService: Webservice) {
        self.webService = webService
    }
    
    
    func populateProducts() async throws {
        
        // but webservice can blow up so we put it in a try/ throws
        products = try await webService.getProducts()
    }
    
    
    
}
