//
//  ViewModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data needed by view

class WeatherViewModel: ObservableObject {
    @Published var title: String
    @Published var temp: String
    @Published var description: String
    @Published var timeZone: String
}
