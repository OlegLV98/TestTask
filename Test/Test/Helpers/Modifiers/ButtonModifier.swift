//
//  ButtonModifier.swift
//  Test
//
//  Created by Oleg Lesnoy on 17.08.2024.
//

import SwiftUI
struct MyPickerButtonStyle: ViewModifier {
    var isSelected: Bool
    func body(content: Content) -> some View {
        content
            .frame(height: 32)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .appWhite : .appDarkGray)
            .background(isSelected ? .appPink : .appWhite)
    }
}

