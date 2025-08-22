//
//  ContentView.swift
//  FakeStoreMVVM
//
//  Created by Siddharth Shekar on 8/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webService: Webservice())
    
    var body: some View {
        VStack{
            List(vm.products){ product in
                
                Text(product.title)
                
            }.task {
                await vm.populateProducts()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
