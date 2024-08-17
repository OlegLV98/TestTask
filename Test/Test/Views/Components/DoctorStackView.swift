//
//  DoctorStackView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct DoctorStackView: View {
    var doctors: Users
    init(doctors: Users) {
        self.doctors = doctors
    }
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(doctors, id: \.id) {doctor in
                    NavigationLink(destination: {
                        CardDetailsView(doctor: doctor)
                            .toolbarRole(.editor)
                            .background(.appLightGray)
                    }, label: {
                        DoctorCard(doctor: doctor)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
