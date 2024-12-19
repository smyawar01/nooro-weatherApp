//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    let rootComponent = AppComponent().homeComponent
    var body: some Scene {
        WindowGroup {
            rootComponent.homeView
        }
    }
}
