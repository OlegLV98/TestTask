//
//  PriceDetailsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct PriceDetailsView: View {
    var body: some View {
        VStack(spacing: 24) {
            ForEach(0..<3) {_ in
                VStack(alignment: .leading, spacing: 12) {
                    Text("Видеоконсультация")
                        .fontWeight(.semibold)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(height: 56)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            HStack {
                                Text("30 мин")
                                Spacer()
                                Text("600 ₽")
                                    .fontWeight(.semibold)
                            }
                            .padding(.horizontal, 16)
                        }
                }
            }
            Spacer()
        }
        .frame(height: .infinity)
        .font(.system(size: 16))
        .padding(16)
        .navigationTitle("Стоимость услуг")
    }
}

#Preview {
    PriceDetailsView()
}
