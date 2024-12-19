//
//  nooro_weatherAppTests.swift
//  nooro-weatherAppTests
//
//  Created by Yawar Muhammad  on 16/12/2024.
//

import XCTest
@testable import nooro_weatherApp

final class HomeViewModelTests: XCTestCase {

    func test_onLoadCallLoad_showNoDataStateWhenNoSavedData() async throws {
        
        let loadUseCase = LoadWeatherUseCaseSpy()
        let sut = HomeViewModel(loadUseCase: loadUseCase,
                                fetchUseCase: FetchWeatherUseCaseSpy(),
                                saveUseCase: SaveWeatherUseCaseSpy())
        let expectation = XCTestExpectation(description: "Load when no save data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1,
                                      execute: DispatchWorkItem(block: {
            
            switch sut.state {
            case .savedWeather(let viewData):
                XCTAssert(loadUseCase.requestCallCount == 1, "")
                switch viewData {
                    
                case .noDataMessage(_):
                    XCTAssert(true)
                default:
                    XCTFail("Invalid State on load weather")
                }
            default:
                XCTFail("Invalid State on load weather")
            }
            expectation.fulfill()
        }))
        sut.loadWeather()
        await fulfillment(of: [expectation],  timeout: 2)
    }
    func test_onLoadCallLoad_showSavedDataWhenDataIsSaved() async throws {
        
        let loadUseCase = LoadWeatherUseCaseSpy()
        loadUseCase.success = true
        let sut = HomeViewModel(loadUseCase: loadUseCase,
                                fetchUseCase: FetchWeatherUseCaseSpy(),
                                saveUseCase: SaveWeatherUseCaseSpy())
        
        let expectation = XCTestExpectation(description: "Load when saved data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1,
                                      execute: DispatchWorkItem(block: {
            
            switch sut.state {
            case .savedWeather(let viewData):
                XCTAssert(loadUseCase.requestCallCount == 1, "")
                switch viewData {
                    
                case .weather(_):
                    XCTAssert(true)
                default:
                    XCTFail("Invalid State on load weather")
                }
            default:
                XCTFail("Invalid State on load weather")
            }
            expectation.fulfill()
        }))
        sut.loadWeather()
        await fulfillment(of: [expectation],  timeout: 2)
    }
}


