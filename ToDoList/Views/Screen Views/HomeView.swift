//
//  HomeView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(red: 232/255, green: 227/255, blue: 227/255)
                .ignoresSafeArea()
            VStack{
                Text("This is Home View!")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
