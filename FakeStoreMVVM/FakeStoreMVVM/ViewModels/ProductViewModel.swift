//
//  ProductViewModel.swift
//  FakeStoreMVVM
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation


// For MVVM we have to create a ProductViewModel
// Do display the individual properties of a product

struct ProductViewModel:Identifiable {
    
     private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id:Int{
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double{
        product.price
    }
    
}
