//
//  CardDetailsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct CardDetailsView: View {
    var doctor: User
    init(doctor: User) {
        self.doctor = doctor
    }
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 16) {
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
                    VStack(alignment: .leading) {
                        Text(doctor.lastName ?? "")
                        Text("\(doctor.firstName ?? "") \(doctor.patronymic ?? "")")
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.appBlack)
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Опыт работы: \(doctor.seniority ?? 0) лет")
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "cross.case")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Врач высшей категории")
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "graduationcap.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("1-й ММИ им. И.М.Сеченова")
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "mappin.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Детская клиника “РебёнОК” ")
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(.appDarkGray)
                VStack(spacing: 24) {
                    NavigationLink(destination: {
                        PriceDetailsView()
                            .toolbarRole(.editor)
                            .background(.appLightGray)
                    }, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.appWhite)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                HStack {
                                    Text("Стоимость услуг")
                                    Spacer()
                                    Text("от 600 ₽")
                                }
                                .padding(.horizontal, 16)
                                .foregroundStyle(.appBlack)
                                .font(.system(size: 16, weight: .semibold))
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                        .lineSpacing(10)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.appBlack)
                }
            }
            Spacer()
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(true ? .appPink : .appGray)
                    .frame(height: 56)
                    .overlay {
                        true ? Text("Записаться") : Text("Нет свободного расписания")
                    }
                    .foregroundStyle(true ? .appWhite : .appBlack)
//                if true {
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(.appPink)
//                        .frame(height: 56)
//                        .overlay {
//                            Text("Записаться")
//                                .foregroundStyle(.white)
//                        }
//                } else {
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(.appGray)
//                        .frame(height: 56)
//                        .overlay {
//                            Text("Нет свободного расписания")
//                                .foregroundStyle(.black)
//                        }
//                }
            })
            .font(.system(size: 16, weight: .semibold))
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 10)
        .navigationTitle("Педиатр")
    }
}

//#Preview {
//    CardDetailsView()
//}
