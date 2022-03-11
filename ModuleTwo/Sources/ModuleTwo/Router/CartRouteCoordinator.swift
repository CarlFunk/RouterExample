//
//  CartRouteCoordinator.swift
//  ModuleTwo
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import Router
import SwiftUI

class CartRouteCoordinator: DefaultSingleRouteCoordinator {
    override func routeView() -> AnyView {
        guard let cartRoute = route as? CartRoute else {
            return AnyView(EmptyView())
        }
        
        return AnyView(CartView(routeCoordinator: self, items: cartRoute.items))
    }
}
