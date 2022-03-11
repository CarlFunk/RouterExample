//
//  RouterExampleApp.swift
//  RouterExample
//
//  Created by Carl Funk on 3/7/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import ModuleShare
import SwiftUI

@main
struct RouterExampleApp: App {
    private static let appRouteCoordinator = AppRouteCoordinator(parent: nil)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                homeView()
            }
        }
    }
    
    @ViewBuilder
    private func homeView() -> some View {
        let appHomeRoute = HomeRoute()
        
        RouterExampleApp.appRouteCoordinator.routeCoordinator(for: appHomeRoute)?.init(route: appHomeRoute, parent: RouterExampleApp.appRouteCoordinator).routeView()
    }
}
