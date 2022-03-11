//
//  CartRoute.swift
//  ModuleShare
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import Router

public struct CartRoute: Route {
    private enum DataKey: String {
        case items
    }
    
    public static var routeIdentifier: String = "Cart"
    public var data: [String : Any]
    
    public init(items: [String]) {
        data = [
            DataKey.items.rawValue: items
        ]
    }
    
    public var items: [String] {
        return data[DataKey.items.rawValue] as! [String]
    }
}
