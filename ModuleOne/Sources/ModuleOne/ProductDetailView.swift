//
//  ProductDetailView.swift
//  ModuleOne
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import Router
import SwiftUI

struct ProductDetailView: View {
    var routeCoordinator: ProductDetailRouteCoordinator
    @State var item: String
    
    var body: some View {
        ZStack {
            RouteCoordinatorView(routeCoordinator: routeCoordinator)
            
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray)
                    .frame(width: 64, height: 64)
                
                Text(item)
                
                Button(
                    action: {
                        routeCoordinator.navigate(to: CartRoute(items: [item]))
                    },
                    label: {
                        Text("Add to cart")
                    })
                    .padding(.vertical)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationTitle(Text("Product Detail"))
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    private static var route: ProductDetailRoute {
        ProductDetailRoute(item: "Apple")
    }
    
    static var previews: some View {
        ProductDetailView(routeCoordinator: ProductDetailRouteCoordinator(route: route, parent: nil), item: route.item)
    }
}
