//
//  ProductListViewModel.swift
//  FakeStoreMVVM
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation


// webservice could be made as a dependency
// dependency injection


// !!!! SInce the products are marked with @published
// They need to be assign on the main queue by using the @MainActor

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    let webService: Webservice
    
    init(webService: Webservice) {
        self.webService = webService
    }
    
    // the function gets the product
    // and we use async and await on it
    func populateProducts() async {
        
        do{
            let products = try await webService.getProducts()
            
            // !!!! lhs is array of ProductViewModel
            // but rhs is array of Products.
            // map takes EACH product in the array and call
            // ProductViewModel.init which takes in the product
            self.products = products.map(ProductViewModel.init)
            
        }catch{
            // if it is sending an error then catch the error
            print(error)
        }
    }
}

