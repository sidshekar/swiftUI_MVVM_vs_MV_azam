//
//  ContentView.swift
//  FakeStoreMVPattern
//
//  Created by Siddharth Shekar on 8/22/25.
//

import SwiftUI

struct ContentView: View {
    
    // store model has a dependency of webservice
    @StateObject private var storeModel = StoreModel(webService: Webservice())
    
    var body: some View {
        
        VStack {
            List(storeModel.products){ product in
                Text(product.title)
            }
        }.task {
            
            // populate products uses async and throws !!
            do{
                try await storeModel.populateProducts()
            } catch {
                print (error)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
