//
//  LoadWeatherUseCaseSpy.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 19/12/2024.
//

@testable import nooro_weatherApp

class LoadWeatherUseCaseSpy: LoadWeatherUseCase {
    
    var requestCallCount = 0
    var success = false
    func onExecution() async -> nooro_weatherApp.SavedWeatherViewData {
        
        requestCallCount += 1
        return success ? WeatherFixtures.savedWeatherViewData : WeatherFixtures.savedWeatherNoData
    }
}
class FetchWeatherUseCaseSpy: FetchWeatherUseCase {
    
    var requestCallCount = 0
    var success = false
    func onExecution(city: String) async -> (nooro_weatherApp.Weather, nooro_weatherApp.FetchedWeatherViewData)? {
        
        requestCallCount += 1
        return success ? (Weather() , WeatherFixtures.fetchedWeatherViewData) : nil
    }
}
class SaveWeatherUseCaseSpy: SaveWeatherUseCase {
    
    var requestCallCount = 0
    var success = false
    func save(weather: nooro_weatherApp.Weather) {
        
        requestCallCount += 1
    }
}

class WeatherRespositoryMock: WeatherRespository {
    
    var success = false
    func load() async -> Result<nooro_weatherApp.Weather, nooro_weatherApp.WeatherError> {
        
        return .failure(.noData)
    }
    func fetch(for city: String) async throws -> nooro_weatherApp.Weather? {
        
        //MARK: TODO
        return success ? WeatherFixtures.weather : nil
    }
    
    func save(weather: nooro_weatherApp.Weather) {
        
        //MARK: TODO
    }
}

