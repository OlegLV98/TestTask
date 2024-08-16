//
//  DoctorCard.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI

struct DoctorCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame(height: 224)
                .frame(maxWidth: .infinity)
            VStack(spacing: 15) {
                HStack(alignment: .top,spacing: 16) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Осташков")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Кирилл Вячеславович")
                            .font(.system(size: 16, weight: .semibold))
                        HStack(spacing: 2.4) {
                            ForEach(0..<5) {_ in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text("Педиатр・стаж 9 лет")
                            .font(.system(size: 14))
                        Text("от 400 ₽")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    Spacer()
                    Image(systemName: "suit.heart.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}, label: {
                    if true {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 1, green: 0.2428272963, blue: 0.4787892699, alpha: 1)))
                            .frame(height: 47)
                            .overlay {
                                Text("Записаться")
                                    .foregroundStyle(.white)
                            }
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray)
                            .frame(height: 47)
                            .overlay {
                                Text("Нет свободного расписания")
                                    .foregroundStyle(.black)
                            }
                    }
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

#Preview {
    DoctorCard()
}
