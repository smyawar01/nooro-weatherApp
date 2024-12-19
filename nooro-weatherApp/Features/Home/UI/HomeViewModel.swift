//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Yawar Muhammad  on 17/09/2024.
//

import Foundation
import Combine

public enum HomeViewState {
    
    case initial
    case savedWeather(SavedWeatherViewData)
    case fetchedWeather(FetchedWeatherViewData)
}
public protocol HomeViewModelProtocol: ObservableObject {
    
    var state: HomeViewState { get }
    func loadWeather()
    func fetchWeather(of city: String)
    func save()
}
public class HomeViewModel: HomeViewModelProtocol {
    
    //MARK: Private
    private let loadWeatherUseCase: LoadWeatherUseCase
    private let fetchWeatherUseCase: FetchWeatherUseCase
    private let saveWeatherUseCase: SaveWeatherUseCase
    private var weather: Weather?
    
    //MARK: Public
    @Published public var state: HomeViewState = .initial
    
    public init(
        loadUseCase: LoadWeatherUseCase,
        fetchUseCase: FetchWeatherUseCase,
        saveUseCase: SaveWeatherUseCase
    ) {
        
        loadWeatherUseCase = loadUseCase
        fetchWeatherUseCase = fetchUseCase
        saveWeatherUseCase = saveUseCase
    }
    public func loadWeather() {
        Task {
            let weather = await loadWeatherUseCase.onExecution()
            await updateState(state: .savedWeather(weather))
        }
    }
    public func fetchWeather(of city: String) {
        Task {
            let weather = await fetchWeatherUseCase.onExecution(city: city)
            if let (weather, viewData) = weather {
                self.weather = weather
                await updateState(state: .fetchedWeather(viewData))
            }
        }
    }
    public func save() {
        
        if let weather = self.weather {
            saveWeatherUseCase.save(weather: weather)
        }
    }
}
@MainActor
private extension HomeViewModel {
    
    func updateState(state: HomeViewState) {
        
        self.state = state
    }
}
