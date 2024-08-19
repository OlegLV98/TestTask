//
//  DataManager.swift
//  Test
//
//  Created by Oleg Lesnoy on 19.08.2024.
//

import Foundation
enum ReadWriteError: Error, CustomStringConvertible {
    case badURL(fileName: String)
    case badData(error: Error)
    
    var description: String {
        switch self {
        case .badURL(let name): "Файл \"\(name).json\" не найден."
        case .badData(let error): "Ошибка: \(error.localizedDescription)"
        }
    }
}

protocol DataManagerProtocol {
    func loadDataFromJSON(name: String) -> Result<ReceivedData, Error>
}
class DataManager {
    static let shared = DataManager()
    private init() {}
    
    func loadDataFromJSON(name: String) -> Result<ReceivedData, Error> {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            return .failure(ReadWriteError.badURL(fileName: name))
        }
        
        do {
            let data = try Data(contentsOf: url)
            let jsonData = try JSONDecoder().decode(ReceivedData.self, from: data)
            return .success(jsonData)
        } catch {
            return .failure(ReadWriteError.badData(error: error))
        }
    }
}

