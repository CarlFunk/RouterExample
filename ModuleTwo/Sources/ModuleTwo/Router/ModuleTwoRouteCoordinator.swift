//
//  ModuleTwoRouteCoordinator.swift
//  ModuleTwo
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import ModuleShare
import Router

public class ModuleTwoRouteCoordinator: DefaultMultiRouteCoordinator {
    override public var routeCoordinatorsByIdentifier: [String : SingleRouteCoordinator.Type] {
        return [
            CartRoute.routeIdentifier: CartRouteCoordinator.self
        ]
    }
}
