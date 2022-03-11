//
//  AppRouteCoordinator.swift
//  RouterExample
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import ModuleShare
import ModuleOne
import ModuleTwo
import Router

class AppRouteCoordinator: MultiRouteCoordinator {
    var parent: RouteCoordinator?
    
    required init(parent: RouteCoordinator?) {
        self.parent = parent
    }
    
    var routeCoordinatorsByIdentifier: [String : SingleRouteCoordinator.Type] {
        return [
            HomeRoute.routeIdentifier: AppHomeRouteCoordinator.self
        ]
    }
    
    var moduleCoordinators: [MultiRouteCoordinator] {
        return [
            ModuleOneRouteCoordinator(parent: self),
            ModuleTwoRouteCoordinator(parent: self)
        ]
    }
    
    func routeCoordinator(for route: Route) -> SingleRouteCoordinator.Type? {
        if let routeCoordinator = routeCoordinatorsByIdentifier[route.identifier] {
            return routeCoordinator
        }
        
        for multiRouteCoordinator in moduleCoordinators {
            if let routeCoordinator = multiRouteCoordinator.routeCoordinatorsByIdentifier[route.identifier] {
                return routeCoordinator
            }
        }
        
        return nil
    }
}
