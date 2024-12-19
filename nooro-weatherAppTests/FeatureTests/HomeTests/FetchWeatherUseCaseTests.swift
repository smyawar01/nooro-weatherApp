//
//  FetchWeatherUseCaseTests.swift
//  nooro-weatherAppTests
//
//  Created by Yawar Muhammad  on 19/12/2024.
//

import XCTest
@testable import nooro_weatherApp

final class FetchWeatherUseCaseTests: XCTestCase {
    
    func test_onExecution_returnErrorOnRepositoryFailure() async throws {
        
        let repo = WeatherRespositoryMock()
        let sut = FetchWeatherUseCaseImpl(repo: repo)
        
        let data = await sut.onExecution(city: "Mumbai")
        XCTAssertNil(data)
    }
    func test_onExecution_returnWeatherOnRepositorySuccess() async throws {
        
        let repo = WeatherRespositoryMock()
        repo.success = true
        let sut = FetchWeatherUseCaseImpl(repo: repo)
        
        let data = await sut.onExecution(city: "Mumbai")
        XCTAssertNotNil(data)
    }
}
