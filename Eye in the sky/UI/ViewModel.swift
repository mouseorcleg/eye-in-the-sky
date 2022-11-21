//
//  ViewModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data needed by view, when it updates, view updates as well

class WeatherViewModel: ObservableObject {
    @Published var title: String = "Where am I?"
    @Published var temp: String = "Is it cold?"
    @Published var description: String = "Or do I feel cold?"
    @Published var humidity: String = "Am I curly?"
    @Published var wind: String = "Is it windy?"
    @Published var icon: String = ""
    //add stale: Bool
    //if stale show in gray
    
    init(city: String) {
        fetchWeatherUI()
    }
    
    func fetchWeatherUI() {
        //there will 2 options:
        //1) success that can be fresh or stale
        //2) error that will show city name and all other fields in darker gray
    }
}
