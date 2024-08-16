//
//  CustomSegmentedPickerView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI
enum Segment {
    case price
    case experience
    case rating
}
struct CustomSegmentedPickerView: View {
    @Binding var selection: Segment
    init(selection: Binding<Segment>) {
        self._selection = selection
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 1, green: 0.2428272963, blue: 0.4787892699, alpha: 1)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    var body: some View {
        Picker("", selection: $selection) {
            Text("По цене")
            .tag(Segment.price)
            Text("По стажу")
                .tag(Segment.experience)
            Text("По рейтингу")
                .tag(Segment.rating)
        }
        .pickerStyle(.segmented)
            
    }
}
