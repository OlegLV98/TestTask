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
        case .main: MainView()
        case .calendar: CalendarView()
        case .chat: ChatView()
        case .profile: ProfileView()
        }
    }
    
    var image: ImageResource {
        switch self {
        case .main: return .main
        case .calendar: return .calendar
        case .chat: return .chat
        case .profile: return .profile
        }
    }
}
struct TabsView: View {
    @State private var msgCount: Int = 1
    @State private var selection: Tab = .main
    init() {
        UITabBarItem.appearance().badgeColor = .appPink
        UITabBar.appearance().backgroundColor = .yellow
    }
    var body: some View {
                TabView(selection: $selection) {
                    ForEach(Tab.allCases, id: \.self) {tab in
                        NavigationStack {
                            tab.view
                                .background(.appLightGray)
                                .toolbar(.hidden, for: .tabBar)
                                .ignoresSafeArea(edges: .bottom)
                        }
                        .tag(tab)
                    }
                }
                .overlay {
                    VStack {
                        Spacer()
                        tabBar
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
    }
    
    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) {tab in
                Button {
                    selection = tab
                } label: {
                    Rectangle()
                        .fill(.appWhite)
                        .frame(height:83)
                        .overlay {
                            VStack(spacing: 3) {
                                Image(tab.image)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(selection == tab ? .appPink : .appDarkGray)
                                    .overlay(alignment: .topTrailing) {
                                        if tab == .chat {
                                            CustomBadge(count: $msgCount)
                                        }
                                    }
                                Text(tab.rawValue)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.appDarkGray)
                            }
                        }
                }
                .buttonStyle(TabButtonStyle())
            }
        }
    }
}

#Preview {
    TabsView()
}
