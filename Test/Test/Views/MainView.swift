//
//  MainView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel.shared
    @State private var searchTerm = ""
    @State private var selection: Segment = .price
    var sortedDoctors: Users {
        return viewModel.doctors
            .sorted { (doc1, doc2) -> Bool in
                switch selection {
                case .price:
                    doc1.hospitalPrice ?? 0 > doc2.hospitalPrice ?? 0
                case .experience:
                    doc1.seniority ?? 0 > doc2.seniority ?? 0
                case .rating:
                    doc1.ratingsRating ?? 0 > doc2.ratingsRating ?? 0
                }
            }
    }
    var filteredDoctors: Users {
        guard !searchTerm.isEmpty else {
            return sortedDoctors
        }
        return sortedDoctors.filter {
            ($0.firstName ?? "").localizedCaseInsensitiveContains(searchTerm) ||
            ($0.lastName ?? "").localizedCaseInsensitiveContains(searchTerm) ||
            ($0.patronymic ?? "").localizedCaseInsensitiveContains(searchTerm)
        }
    }
    var body: some View {
        VStack(spacing: 24) {
            CustomSegmentedPickerView(selection: $selection)
            DoctorStackView(doctors: filteredDoctors)
        }
        .padding(.horizontal, 15)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатры")
                    .foregroundStyle(.appBlack)
                    .font(.system(size: 20))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchTerm, prompt: Text("Поиск"))
    }
}

#Preview {
    MainView()
}
