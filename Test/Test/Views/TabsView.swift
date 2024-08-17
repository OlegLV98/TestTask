//
//  TabsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI
enum Tab: String, CaseIterable {
    case main = "Главная"
    case calendar = "Приёмы"
    case chat = "Чат"
    case profile = "Профиль"
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            MainView()
        case .calendar:
            CalendarView()
        case .chat:
            ChatView()
        case .profile:
            ProfileView()
        }
    }
    
    var image: ImageResource {
        switch self {
        case .main:
            return .main
        case .calendar:
            return .calendar
        case .chat:
            return .chat
        case .profile:
            return .profile
        }
    }
}
struct TabsView: View {
    @State private var selection: Tab = .main
    init() {
        UITabBarItem.appearance().badgeColor = .appPink
    }
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Tab.allCases, id: \.self) {tab in
                NavigationStack {
                    tab.view
                        .background(.appLightGray)
                }
                .tabItem {
                    Label(tab.rawValue, image: tab.image)
                }
                .tag(tab)
                .badge(tab == .chat ? 1 : 0)
            }
        }
//        TabView(selection: $selection) {
//            NavigationStack {
//                MainView()
//                    .background(.appLightGray)
//            }
//            .tabItem {
//                Label("Главная", image: .main)
//            }
//            .tag(Tab.main)
//            CalendarView()
//                .background(.appLightGray)
//                .tabItem {
//                    Label("Приёмы", image: .calendar)
//                }
//                .tag(Tab.calendar)
//            ChatView()
//                .background(.appLightGray)
//                .tabItem {
//                    Label("Чат", image: .chat)
//                }
//                .tag(Tab.chat)
//                .badge(1)
//            ProfileView()
//                .background(.appLightGray)
//                .tabItem {
//                    Label("Профиль", image: .profile)
//                }
//                .tag(Tab.profile)
//        }
    }
}

#Preview {
    TabsView()
}
