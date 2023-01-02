//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 6.12.22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var userObject = UserViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                OnBoardingView()
                    .environmentObject(userObject)
            }.navigationViewStyle(.stack)
            
        }
    }
}
