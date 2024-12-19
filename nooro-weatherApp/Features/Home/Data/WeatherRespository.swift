//
//  WeatherRespository.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import Foundation
import Combine

public enum WeatherError: Error {
    
    case invalidUrl
    case noData
    case network(NetworkError)
    case dataParsing
}
public protocol WeatherRespository {
    
    func load() async -> Result<Weather, WeatherError>
    func fetch(for city: String) async throws -> Weather?
    func save(weather: Weather)
}

public struct WeatherRespositoryImpl: WeatherRespository {
    
    let networkService: NetworkService
    public func load() async -> Result<Weather, WeatherError> {
        
        guard let data = UserDefaults.standard.data(forKey: "SavedWeather") else {
            
            return .failure(.noData)
        }
        let decoder = JSONDecoder()
        do {
            
            let savedWeather = try decoder.decode(Weather.self, from: data)
            return .success(savedWeather)
        } catch {
            
            return .failure(.dataParsing)
        }
    }
    public func fetch(for city: String) async throws -> Weather? {
        
        guard let url = URL(string: "\(AppConfigs.baseUrl)/current.json?key=\(AppConfigs.apiKey)&q=\(city)&aqi=no") else {
            
            throw WeatherError.invalidUrl
        }
        return try await networkService.execute(url: url)
    }
    public func save(weather: Weather) {
        
        let encoder = JSONEncoder()
            
            do {
                // Encode the weather object to Data
                let encodedWeather = try encoder.encode(weather)
                
                // Store it in UserDefaults
                UserDefaults.standard.set(encodedWeather, forKey: "SavedWeather")
                
            } catch {
                print("Failed to encode weather: \(error)")
            }
    }
}
