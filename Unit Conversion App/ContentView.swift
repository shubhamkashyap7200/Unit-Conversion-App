//
//  ContentView.swift
//  Unit Conversion App
//
//  Created by Shubham on 21/07/23.
//

import SwiftUI

enum TemperatureUnits: String {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

struct ContentView: View {
    @State private var inputTemperature = 0.0
    let units = [TemperatureUnits.celsius.rawValue, TemperatureUnits.fahrenheit.rawValue, TemperatureUnits.kelvin.rawValue]
    @State private var selectedInputUnit = "Celsius"
    @State private var selectedOutputUnit = "Fahrenheit"
    
    private var outputTemperature: Double {
        let selectedInputUnit = selectedInputUnit
        let selectedOutputUnit = selectedOutputUnit
        var outputTemperatureValue = 0.0
        
        if selectedInputUnit == TemperatureUnits.celsius.rawValue {
            if selectedInputUnit == selectedOutputUnit {
                outputTemperatureValue = inputTemperature
            } else if selectedOutputUnit == TemperatureUnits.fahrenheit.rawValue {
                outputTemperatureValue = (inputTemperature * 9/5) + 32
            } else if selectedOutputUnit == TemperatureUnits.kelvin.rawValue {
                outputTemperatureValue = inputTemperature + 273.15
            }
            
        } else if selectedInputUnit == TemperatureUnits.fahrenheit.rawValue {
            if selectedInputUnit == selectedOutputUnit {
                outputTemperatureValue = inputTemperature
            } else if selectedOutputUnit == TemperatureUnits.celsius.rawValue {
                outputTemperatureValue = 5/9 * (inputTemperature - 32)
            } else if selectedOutputUnit == TemperatureUnits.kelvin.rawValue {
                outputTemperatureValue = (inputTemperature - 32) * 5/9 + 273.15
            }
        } else if selectedInputUnit == TemperatureUnits.kelvin.rawValue {
            if selectedInputUnit == selectedOutputUnit {
                outputTemperatureValue = inputTemperature
            } else if selectedOutputUnit == TemperatureUnits.celsius.rawValue {
                outputTemperatureValue = inputTemperature - 273.15
            } else if selectedOutputUnit == TemperatureUnits.fahrenheit.rawValue {
                outputTemperatureValue = (inputTemperature - 273.15) * 9/5 + 32
            }
            
        }
        
        return outputTemperatureValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: Input value
                Section {
                    TextField("Enter Value", value: $inputTemperature, format: .number)
                    
                    Picker("Input unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Input temperature value")
                }
                
                
                // MARK: Out value
                Section {
                    Text("\(outputTemperature, specifier: "%.2f")")
                    Picker("Output unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Output temperature value")
                }
            }
            
            .navigationTitle("Unit conversion")
        }
    }
}

#Preview {
    ContentView()
}
