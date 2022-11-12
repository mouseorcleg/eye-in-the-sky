//
//  WeatherListView.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

struct WeatherListView: View {
    
    // updates when viewModel data is updated
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                //fetches data from a viewModel
                
                
            }
            .navigationTitle("Whether the weather")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
