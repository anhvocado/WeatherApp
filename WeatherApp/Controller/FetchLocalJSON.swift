////
////  FetchLocalJSON.swift
////  WeatherApp
////
////  Created by Nguyễn Thị Vân Anh on 23/09/2022.
////
//
//import Foundation
//
//struct CityData: Codable {
//    let city: String
//    let lat: String
//    let lng: String
//    let country: String
//}
//
//class DataLoader {
//    var cityData = [CityData]()
//    
//    init() {
//        load()
//    }
//    
//    func load(){
//        if let fileLocation = Bundle.main.url(forResource: "vn", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let jsonDecoder = JSONDecoder()
//                let dataFromJson = try jsonDecoder.decode([CityData].self, from: data)
//                
//                self.cityData = dataFromJson
//            } catch {
//                print(error)
//            }
//        }
//    }
//    
//    
//}
