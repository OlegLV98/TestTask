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
                        .fill(.appWhite)
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
        .foregroundStyle(.appBlack)
        .font(.system(size: 16))
        .padding(16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Стоимость услуг")
                    .foregroundStyle(.appBlack)
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    PriceDetailsView()
}
