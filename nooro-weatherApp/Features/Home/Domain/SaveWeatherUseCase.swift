//
//  SaveWeatherUseCase.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 19/12/2024.
//


public protocol SaveWeatherUseCase {
    func save(weather: Weather)
}

public struct SaveWeatherUseCaseImpl: SaveWeatherUseCase {
    
    let repo: WeatherRespository
    
    public func save(weather: Weather) {
        
        repo.save(weather: weather)
    }
}
