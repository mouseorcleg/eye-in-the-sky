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
    
    private func generateURL(city: String) -> URL? {
        return URL(string: "\(endpoint)?q=\(city)&appid=\(key)")
    }
    
    func updateWeather(city: String, completion: @escaping (Result<WeatherDataModel, WeatherError>) -> Void) {
        guard let url = generateURL(city: city) else {
            return completion(.failure(WeatherError(msg: "Failed to create url")))
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil
            else {
                return completion(.failure(WeatherError(msg: "Couldn't get data from URL")))
            }
            
            // Convert data to model
            
            do {
                let model = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                return completion(.success(model))
            }
            catch {
                return completion(.failure(WeatherError(msg: "failed to decode JSON data")))
            }
            
        }
        task.resume()
        
        return
    }
    
}
