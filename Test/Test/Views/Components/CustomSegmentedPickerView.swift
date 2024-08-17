//
//  CustomSegmentedPickerView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI
enum Segment: String, CaseIterable {
    case price = "По цене"
    case experience = "По стажу"
    case rating = "По рейтингу"
}

struct CustomSegmentedPickerView: View {
    @Binding var selection: Segment
    init(selection: Binding<Segment>) {
        self._selection = selection
    }
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Segment.allCases, id: \.self) { segment in
                Button(action: {
                    selection = segment
                }, label: {
                    HStack(spacing: 6) {
                        Text(segment.rawValue)
                        if segment == .price {
                            Image("arrowDown")
                        }
                    }
                    .font(.system(size: 14))
                })
                .tag(segment)
                .modifier(MyPickerButtonStyle(isSelected: selection == segment))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
