//
//  OnBoardingView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 2.1.23.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject var userObject: UserViewModel
    var body: some View {
        if(userObject.isAuthenticated){
            MainView()
                .environmentObject(userObject)
        }
        else{
            LoginView()
                .environmentObject(userObject)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
