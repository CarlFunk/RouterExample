//
//  ProductDetailRouteCoordinator.swift
//  ModuleOne
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import Router
import SwiftUI

class ProductDetailRouteCoordinator: DefaultSingleRouteCoordinator {
    override func routeView() -> AnyView {
        if let deeplinkRoute = route as? DeeplinkRoute, let detailRoute = deeplinkRoute.currentRoute as? ProductDetailRoute {
            return AnyView(ProductDetailView(routeCoordinator: self, item: detailRoute.item))
        }
        
        if let detailRoute = route as? ProductDetailRoute {
            return AnyView(ProductDetailView(routeCoordinator: self, item: detailRoute.item))
        }
        
        return AnyView(EmptyView())
    }
}
