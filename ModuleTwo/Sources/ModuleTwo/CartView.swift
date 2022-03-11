//
//  CartView.swift
//  ModuleTwo
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import Router
import SwiftUI

struct CartView: View {
    var routeCoordinator: CartRouteCoordinator
    var items: [String]
    
    var body: some View {
        ZStack {
            RouteCoordinatorView(routeCoordinator: routeCoordinator)
            
            List {
                ForEach(items, id:\.self) { item in
                    productRow(item: item)
                }
            }
        }
        .navigationTitle(Text("Cart"))
        .navigationBarItems(trailing: homeButton)
    }
    
    private func productRow(item: String) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray)
                .frame(width: 24, height: 24)
            
            Text(item)
            
            Spacer()
            
            Text("$0.00")
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            routeCoordinator.navigate(to: ProductDetailRoute(item: item))
        }
    }
    
    private var homeButton: some View {
        Button(
            action: {
                routeCoordinator.deeplink(to: HomeDeeplinkRoute())
            },
            label: {
                Text("Home")
            })
    }
}

struct CartView_Previews: PreviewProvider {
    private static var route: CartRoute {
        CartRoute(items: ["Bread", "Milk"])
    }
    
    static var previews: some View {
        CartView(routeCoordinator: CartRouteCoordinator(route: route, parent: nil), items: route.items)
    }
}
