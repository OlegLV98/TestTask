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
                    var minPrice: Int {
                        [doctor.homePrice, doctor.hospitalPrice, doctor.videoChatPrice, doctor.textChatPrice].compactMap{$0}.min() ?? 0
                    }
                    NavigationLink(destination: {
                        CardDetailsView(doctor: doctor, minPrice: minPrice)
                            .toolbarRole(.editor)
                            .background(.appLightGray)
                            .ignoresSafeArea(edges: .bottom)
                    }, label: {
                        DoctorCard(doctor: doctor, minPrice: minPrice)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
        }
        .contentMargins(.bottom, 10, for: .scrollContent)
        .padding(.bottom, 83)
    }
}
