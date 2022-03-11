//
//  ProductListView.swift
//  ModuleOne
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import Router
import SwiftUI

struct ProductListView: View {
    var routeCoordinator: ProductListRouteCoordinator
    
    private let items = [
        "Bread",
        "Cheese",
        "Chicken",
        "Eggs",
        "Milk",
        "Rice",
        "Salad",
        "Soup"
    ]
    
    var body: some View {
        ZStack {
            RouteCoordinatorView(routeCoordinator: routeCoordinator)
            
            List {
                ForEach(items, id:\.self) { item in
                    productRow(item: item)
                }
            }
        }
        .navigationTitle(Text("Products"))
    }
    
    private func productRow(item: String) -> some View {
        VStack(alignment: .leading) {
            Text(item)
                .padding(.vertical)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            routeCoordinator.navigate(to: ProductDetailRoute(item: item))
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(routeCoordinator: ProductListRouteCoordinator(route: ProductListRoute(), parent: nil))
    }
}
