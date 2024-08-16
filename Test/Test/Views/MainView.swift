//
//  MainView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct MainView: View {
    @State var searchTerm = ""
    var body: some View {
        VStack(spacing: 24) {
            CustomSegmentedPickerView()
            DoctorStackView()
        }
        .padding(.horizontal, 15)
        .navigationTitle("Педиатры")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchTerm, prompt: Text("Поиск"))
    }
    
}

#Preview {
    MainView()
}
