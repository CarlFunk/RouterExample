//
//  ProductListRouteCoordinator.swift
//  ModuleOne
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Router
import SwiftUI

class ProductListRouteCoordinator: DefaultSingleRouteCoordinator {
    override func routeView() -> AnyView {
        AnyView(ProductListView(routeCoordinator: self))
    }
}
