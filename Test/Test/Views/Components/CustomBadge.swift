//
//  CustomBadge.swift
//  Test
//
//  Created by Oleg Lesnoy on 17.08.2024.
//

import SwiftUI

struct CustomBadge: View {
    @Binding var count: Int
    var body: some View {
        if count > 0  {
            ZStack {
                Circle()
                    .fill(.appPink)
                    .stroke(.appWhite, lineWidth: 2)
                    .frame(width: 17, height: 17)
                Text(count < 100 ? "\(count)" : "99+")
                    .foregroundStyle(.appWhite)
                    .font(.system(size: 10))
            }
            .offset(x:-2, y:4)
        } else {
            EmptyView()
        }
    }
}
