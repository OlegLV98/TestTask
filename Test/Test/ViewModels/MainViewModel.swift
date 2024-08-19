//
//  MainViewModel.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import Foundation
class MainViewModel: ObservableObject {
    static let shared = MainViewModel()
    private init() {
        getDoctors()
    }
    
    let networkManager = NetworkManager.shared
    let dataManager = DataManager.shared
    
    @Published var doctors: Users = []
    
    func getDoctors() {
        // MARK: getData from File
        let result = dataManager.loadDataFromJSON(name: "data")
        switch result {
        case .success(let receivedData): doctors = receivedData.record.data.users ?? []
        case .failure(let error): print(error)
        }
        
        // MARK: fetchData from Network
//        networkManager.fetchData { result in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {[weak self] in
//                    guard let self else {return}
//                    doctors = data.record.data.users ?? []
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
