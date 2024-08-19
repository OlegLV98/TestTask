//
//  DoctorCard.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct DoctorCard: View {
    var doctor: User
    var minPrice: Int
    init(doctor: User, minPrice: Int) {
        self.doctor = doctor
        self.minPrice = minPrice
    }
    var hasReceptionTime: Bool {
        !doctor.freeReceptionTime.isEmpty
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(.appGray, lineWidth: 1)
            .background(.appWhite)
            .frame(height: 224)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                VStack(spacing: 15) {
                    HStack(alignment: .top,spacing: 16) {
                        AsyncImage(url: URL(string: doctor.avatar ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text(doctor.lastName ?? "")
                                .font(.system(size: 16, weight: .semibold))
                            Text("\(doctor.firstName ?? "") \(doctor.patronymic ?? "")")
                                .font(.system(size: 16, weight: .semibold))
                            HStack(spacing: 2.4) {
                                let rating = Int(doctor.ratingsRating ?? 0)
                                ForEach(0..<5, id: \.self) {i in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(i < rating ? .appPink : .appDarkGray)
                                    
                                }
                            }
                            Text("Педиатр・стаж \(doctor.seniority ?? 0) лет")
                                .font(.system(size: 14))
                            Text("от \(minPrice) ₽")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: doctor.isFavorite ?? false ? "suit.heart.fill" : "suit.heart")
                                .resizable()
                                .scaledToFill()
                                .foregroundStyle(.appSilver)
                                .frame(width: 24, height: 24)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    NavigationLink(destination: {
                        CardDetailsView(doctor: doctor, minPrice: minPrice)
                    }, label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(hasReceptionTime ? .appPink : .appGray)
                                .frame(height: 47)
                                .overlay {
                                    hasReceptionTime ? Text("Записаться") : Text("Нет свободного расписания")
                                }
                                .foregroundStyle(hasReceptionTime ? .appWhite : .appBlack)
                                .font(.system(size: 16, weight: .semibold))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(height: 188)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 16)
            }
    }
}

#Preview {
    DoctorCard(doctor: User(
        id: "4", firstName: "Дарья", lastName: "Семенова", textChatPrice: 600, videoChatPrice: 600, freeReceptionTime: [FreeReceptionTime(time: 20/08/2024)], workExpirience: []
    ),minPrice: 600)
}
