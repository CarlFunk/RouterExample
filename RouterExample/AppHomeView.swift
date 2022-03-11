//
//  AppHomeView.swift
//  RouterExample
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Router
import ModuleShare
import SwiftUI

struct AppHomeView: View {
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
    
    var routeCoordinator: AppHomeRouteCoordinator
    
    var body: some View {
        ZStack {
            RouteCoordinatorView(routeCoordinator: routeCoordinator)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    productsCard
                    productsRow
                    cartCard
                    deeplinkCard
                }
            }
        }
        .navigationTitle("Home")
    }
    
    private var productsCard: some View {
        card(title: "Products") {
            routeCoordinator.navigate(to: ProductListRoute())
        }
    }
    
    private var productsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id:\.self) { item in
                    Text(item)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: 100, height: 100, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(UIColor.secondarySystemBackground)))
                        .onTapGesture {
                            routeCoordinator.navigate(to: ProductDetailRoute(item: item))
                        }
                }
            }
            .padding(.leading)
        }
        .frame(height: 100)
    }
    
    private var cartCard: some View {
        card(title: "Cart") {
            routeCoordinator.navigate(to: CartRoute(items: items))
        }
    }
    
    private var deeplinkCard: some View {
        card(title: "Product Deeplink") {
            routeCoordinator.deeplink(to: ProductDetailDeeplinkRoute())
        }
    }
    
    private func card(title: String, action: @escaping () -> Void) -> some View {
        Text(title)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.secondarySystemBackground)))
            .padding(.horizontal)
            .onTapGesture(perform: action)
    }
}

struct AppHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView(routeCoordinator: AppHomeRouteCoordinator(route: HomeRoute(), parent: nil))
    }
}
