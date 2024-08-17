//
//  DoctorCard.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct DoctorCard: View {
    var doctor: User
    init(doctor: User) {
        self.doctor = doctor
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.appWhite)
                .frame(height: 224)
                .frame(maxWidth: .infinity)
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
                        Text("от 400 ₽")
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
                Button(action: {}, label: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(true ? .appPink : .appGray)
                        .frame(height: 47)
                        .overlay {
                            true ? Text("Записаться") : Text("Нет свободного расписания")
                        }
                        .foregroundStyle(true ? .appWhite : .appBlack)
//                    if true {
//                        RoundedRectangle(cornerRadius: 8)
//                            .fill(.appPink)
//                            .frame(height: 47)
//                            .overlay {
//                                Text("Записаться")
//                                    .foregroundStyle(.white)
//                            }
//                    } else {
//                        RoundedRectangle(cornerRadius: 8)
//                            .fill(.appGray)
//                            .frame(height: 47)
//                            .overlay {
//                                Text("Нет свободного расписания")
//                                    .foregroundStyle(.black)
//                            }
//                    }
                })
                .font(.system(size: 16, weight: .semibold))
            }
            .frame(height: 188)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .padding(.bottom, 16)
        }
        
    }
}
