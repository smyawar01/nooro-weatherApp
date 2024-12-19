//
//  Weather 2.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 18/12/2024.
//


import Foundation

public struct Weather: Codable {
    
    struct Location: Codable {
        var name: String?
    }
    struct Current: Codable {
        
        struct Condition: Codable {
            
            var icon: String?
        }
        var temp_c: Double?
        var humidity: Double?
        var feelslike_c: Double?
        var uv: Double?
        var condition: Condition?
    }
    var location: Location?
    var current: Current?
}
