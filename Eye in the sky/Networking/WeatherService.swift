//
//  WeatherService.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 13/11/2022.
//

import Foundation

class WeatherError: Error {
    let message: String
    init(msg: String) {
        self.message = msg
    }
}

class WeatherService {
    private let key = "cc5f0b417551c77d68956a6336441d72"
    private let endpoint = "https://api.openweathermap.org/data/2.5/weather"
    private let celcius = "metric"
    
    private func generateURL(city: String) -> URL? {
        return URL(string: "\(endpoint)?q=\(city)&appid=\(key)&units=\(celcius)")
    }
    
    func updateWeather(city: String) async -> Result<WeatherDataNetworkingModel, WeatherError> {
        guard let url = generateURL(city: city) else {
            return .failure(WeatherError(msg: "Failed to create url"))
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(WeatherError(msg: "Couldn't get data from URL"))
            }
            let model = try JSONDecoder().decode(WeatherDataNetworkingModel.self, from: data)
            return .success(model)
        }
        catch DecodingError.dataCorrupted {
            return .failure(WeatherError(msg: "failed to decode JSON data"))
        }
        catch {
            return.failure(WeatherError(msg: "Not sure what, but something is qlearly wrong"))
        }
    }
}
