//
//  Formatters.swift
//  nooro-weatherApp
//
//  Created by Yawar Muhammad  on 17/12/2024.
//

import Foundation

struct Formatter {
    
    static func tempratureString(value: Double) -> String {
        
        let measurement = Measurement(value: value,
                                      unit: Locale.current.usesMetricSystem ? UnitTemperature.celsius : UnitTemperature.fahrenheit)

        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitStyle = .short
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        measurementFormatter.unitOptions = .temperatureWithoutUnit

        return measurementFormatter.string(from: measurement)
    }
}
