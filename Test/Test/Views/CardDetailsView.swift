//
//  CardDetailsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct CardDetailsView: View {
    var doctor: User
    let minPrice: Int
    init(doctor: User, minPrice: Int) {
        self.doctor = doctor
        self.minPrice = minPrice
    }
    var hasReceptionTime: Bool {
        !doctor.freeReceptionTime.isEmpty
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
                    categoryLabel(icon: "clock",
                                  text: "Опыт работы: \(doctor.seniority ?? 0) лет")
                    categoryLabel(icon: "bag",
                                  text: "\(categoryLabel(category: doctor.category ?? 0))")
                    categoryLabel(icon: "hat",
                                  text: "\(doctor.educationTypeLabel?.name ?? "")")
                    categoryLabel(icon: "location",
                                  text: !doctor.workExpirience.isEmpty ? "\(doctor.workExpirience[0].organization ?? "")" : "")
                }
                .font(.system(size: 14))
                .foregroundStyle(.appDarkGray)
                VStack(spacing: 24) {
                    NavigationLink(destination: {
                        PriceDetailsView(doctor: doctor)
                            .toolbarRole(.editor)
                            .background(.appLightGray)
                            .ignoresSafeArea(edges: .bottom)
                    }, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.appWhite)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                HStack {
                                    Text("Стоимость услуг")
                                    Spacer()
                                    Text("от \(minPrice) ₽")
                                }
                                .padding(.horizontal, 16)
                                .foregroundStyle(.appBlack)
                                .font(.system(size: 16, weight: .semibold))
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    ScrollView {
                        Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                            .tracking(-0.4)
                            .lineSpacing(8)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.appBlack)
                    }
                }
            }
            Spacer()
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(hasReceptionTime ? .appPink : .appGray)
                    .frame(height: 56)
                    .overlay {
                        hasReceptionTime ? Text("Записаться") : Text("Нет свободного расписания")
                    }
                    .foregroundStyle(hasReceptionTime ? .appWhite : .appBlack)
            })
            .font(.system(size: 16, weight: .semibold))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .padding(.bottom, 93)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатр")
                    .foregroundStyle(.appBlack)
                    .font(.system(size: 20))
            }
        }
    }
    @ViewBuilder
    func categoryLabel(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Image(icon)
                .resizable()
                .frame(width: 24, height: 24)
            Text(text)
        }
    }
    
    func categoryLabel(category: Int) -> String {
        switch category {
        case 1: "Врач второй категории"
        case 2: "Врач первой категории"
        case 3: "Врач высшей категории"
        default: ""
        }
    }
}

#Preview {
    CardDetailsView(doctor: User(
        id: "4", firstName: "efvr", lastName: "efv",textChatPrice: 4, videoChatPrice: 4, freeReceptionTime: [FreeReceptionTime(time: 4)], workExpirience: []
    ), minPrice: 3)
}
