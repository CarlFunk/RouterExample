//
//  ProductDetailRoute.swift
//  ModuleShare
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import Router

public struct ProductDetailRoute: Route {
    private enum DataKey: String {
        case item
    }
    
    public static var routeIdentifier: String = "ProductDetail"
    public var data: [String : Any]
    
    public init(item: String) {
        data = [
            DataKey.item.rawValue: item
        ]
    }
    
    public var item: String {
        return data[DataKey.item.rawValue] as! String
    }
}
