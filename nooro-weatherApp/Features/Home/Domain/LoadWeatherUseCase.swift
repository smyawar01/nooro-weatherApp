//
//  FetchWeatherUseCase.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import Combine

public enum SavedWeatherViewData {
    
    public struct EmptyMessage {
        let title: String
        let description: String
    }
    public struct SavedWeather {
        
        let name: String
        let temprature: String
        let iconUrl: String
        let humidity: String
        let feelsLike: String
        let uv: String
    }
    case weather(SavedWeather)
    case noDataMessage(EmptyMessage)
}
public protocol LoadWeatherUseCase {
    
    func onExecution() async -> SavedWeatherViewData
}
public struct LoadWeatherUseCaseImpl: LoadWeatherUseCase {
    
    private let repo: WeatherRespository
    
    public init(repo: WeatherRespository) {
        
        self.repo = repo
    }
    public func onExecution() async -> SavedWeatherViewData {
        
        let result = await repo.load()
        switch result {
            
        case .success(let weather):
            return .weather(mapper(weather: weather))
        default:
            return .noDataMessage(
                SavedWeatherViewData.EmptyMessage(
                    title: "No City Selected",
                    description: "Please Search For A City"
                )
            )
        }
    }
}
private extension LoadWeatherUseCaseImpl {
    
    func mapper(weather: Weather) -> SavedWeatherViewData.SavedWeather {
        
        return SavedWeatherViewData.SavedWeather(
            name: weather.location?.name ?? "",
            temprature: Formatter.tempratureString(value: weather.current?.temp_c ?? 0),
            iconUrl: weather.current?.condition?.icon.map{ "https:\($0)" } ?? "",
            humidity:  weather.current?.humidity.map{ "\(Int($0))%" } ?? "",
            feelsLike: Formatter.tempratureString(value: weather.current?.feelslike_c ?? 0),
            uv: weather.current?.uv.map{ "\($0)" } ?? ""
        )
    }
}
