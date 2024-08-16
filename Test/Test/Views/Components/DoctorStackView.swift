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
                            .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
                    }, label: {
                        DoctorCard(doctor: doctor)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
