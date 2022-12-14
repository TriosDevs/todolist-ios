//
//  MainView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct MainView: View {
    
    
    
    init(){
        
        UITabBar.appearance().backgroundColor =
        UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        
        
        
        
    }
    
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Label("Home",systemImage: "house")
                    
                    
                    
                    
                    
                    
                }
            
            
            ListView()
                .tabItem {
                    
                    HStack{
                        Label("List",systemImage: "list.bullet.clipboard")
                            .font(.system(size: 120))
                    }
                    .font(.system(size: 120))
                    .padding(.top, 120)
                    
                }
            
            ProfileView()
                .tabItem {
                    
                    Label("Profile", systemImage: "person.crop.circle")
                        .font(.system(size: 70))
                        .frame(width: 350, height: 350)
                    
                }
            
            
            
            
        }
        .tint(.blue)
        .edgesIgnoringSafeArea(.all)
        .frame(height: 877)
        
        
        
        
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
