//
//  MainView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct MainView: View {
    
    
    @State private var tabSelection: Tab = .house
    @EnvironmentObject private var userObject: UserViewModel

    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {

        ZStack {
            Color(red: 232/255, green: 227/255, blue: 227/255)
            VStack {

                TabView(selection: $tabSelection){

                    HomeView()
                        .tag(Tab.house)

                    ListView()
                        .tag(Tab.checklist)

                    ProfileView()
                        .tag(Tab.person)


                }
                
            }
            VStack{
                Spacer()
                BottomNavigationBarView(tabSelection: $tabSelection)
                    .edgesIgnoringSafeArea(.all)
                    
            }
        }





    }

    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
