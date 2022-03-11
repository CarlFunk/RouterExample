//
//  ProductDetailDeeplinkRoute.swift
//  ModuleShare
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import Router

public struct ProductDetailDeeplinkRoute: DeeplinkRoute {
    public static var routeIdentifier = "ProductDetailDeeplink"
    
    public var currentRouteIndex: Int = 0
    public var routes: [Route] = [
        ProductListRoute(),
        ProductDetailRoute(item: "Bread")
    ]
    
    public init() { }
}
