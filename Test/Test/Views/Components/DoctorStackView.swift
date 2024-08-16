//
//  DoctorStackView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct DoctorStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<5) {_ in
                    NavigationLink(destination: {
                        CardDetailsView()
                            .toolbarRole(.editor)
                            .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
                    }, label: {
                        DoctorCard()
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    DoctorStackView()
}
