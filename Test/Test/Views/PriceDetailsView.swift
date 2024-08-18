//
//  PriceDetailsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

enum Place: String {
    case video = "Видеоконсультация"
    case chat = "Чат с врачом"
    case hospital = "Приём в клинике"
}

struct PriceDetailsView: View {
    var doctor: User

    init(doctor: User) {
        self.doctor = doctor
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                priceLabel(place: .video, time: "30", price: doctor.videoChatPrice ?? 0)
                priceLabel(place: .chat, time: "30", price: doctor.textChatPrice ?? 0)
                priceLabel(place: .hospital, time: "В клинике", price: doctor.hospitalPrice ?? 0)
            }
            .foregroundStyle(.appBlack)
            .font(.system(size: 16))
            .padding(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Стоимость услуг")
                        .foregroundStyle(.appBlack)
                        .font(.system(size: 20))
                }
            }
        }
    }
    @ViewBuilder
    func priceLabel(place: Place, time: String, price: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(place.rawValue)
                .fontWeight(.semibold)
            RoundedRectangle(cornerRadius: 8)
                .fill(.appWhite)
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .overlay {
                    HStack {
                        Text(place != .hospital ? "\(time) мин" : "\(time)")
                        Spacer()
                        Text("\(price) ₽")
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 16)
                }
        }
    }
}

#Preview {
    PriceDetailsView(doctor: User(
        id: "4", firstName: "efvr", lastName: "efv",textChatPrice: 4, videoChatPrice: 4, freeReceptionTime: [FreeReceptionTime(time: 4)], workExpirience: []
    ))
}
