//
//  TabsView.swift
//  Test
//
//  Created by Oleg Lesnoy on 16.08.2024.
//

import SwiftUI
enum Tab {
    case main
    case chat
    case calendar
    case profile
}
struct TabsView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
                    .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
            }
            .tabItem {
                Image(systemName: "house")
                Text("Главная")
            }
            .tag(Tab.main)
            CalendarView()
                .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Приёмы")
                }
                .tag(Tab.calendar)
            ChatView()
                .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Чат")
                }
                .tag(Tab.chat)
                .badge(1)
            ProfileView()
                .background(Color(#colorLiteral(red: 0.9607843757, green: 0.9607842565, blue: 0.9607843757, alpha: 1)))
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Профиль")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    TabsView()
}
