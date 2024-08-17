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
//struct CustomSegmentedPickerView: View {
//    @Binding var selection: Segment
//    init(selection: Binding<Segment>) {
//        self._selection = selection
//        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 1, green: 0.2428272963, blue: 0.4787892699, alpha: 1)
//        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
//        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
//    }
//    var body: some View {
//        Picker("", selection: $selection) {
//            Text("По цене")
//            .tag(Segment.price)
//            Text("По стажу")
//                .tag(Segment.experience)
//            Text("По рейтингу")
//                .tag(Segment.rating)
//        }
//        .pickerStyle(.segmented)
//            
//    }
//}

//struct CustomSegmentedPickerView: View {
//    @Binding var selection: Segment
//    init(selection: Binding<Segment>) {
//        self._selection = selection
//    }
//    var body: some View {
//        HStack(spacing: 0) {
//            Button(action: {
//                selection = .price
//            }, label: {
//                HStack {
//                    Text("По цене")
//                    Image(systemName: "arrow.down")
//                }
//            })
//            .tag(Segment.price)
//            .modifier(MyPickerButtonStyle(isSelected: selection == .price))
//            Button(action: {
//                selection = .experience
//            }, label: {
//                HStack {
//                    Text("По стажу")
//                }
//            })
//            .tag(Segment.experience)
//            .modifier(MyPickerButtonStyle(isSelected: selection == .experience))
//            Button(action: {
//                selection = .rating
//            }, label: {
//                HStack {
//                    Text("По рейтингу")
//                }
//            })
//            .tag(Segment.rating)
//            .modifier(MyPickerButtonStyle(isSelected: selection == .rating))
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//    }
//}

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
