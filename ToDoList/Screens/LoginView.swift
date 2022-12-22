//
//  LoginView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 6.12.22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Login")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("To-Do-App")
                    
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                    Image("LOGIN 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    VStack(spacing: 20){
                        
                        
                        TextField("", text: $loginModel.mail, prompt: Text("Email"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        SecureField("", text: $loginModel.password, prompt: Text("Password"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1), width: 100)
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        
                        Button(action: {

                            loginModel.login()

                        }, label: {
                            Text("Login")

                                .frame(width: 200)
                                .padding(.vertical, 1)
                                .foregroundColor(.white)



                        })
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(25)
                        
                        
                        
                    }
                }.navigationDestination(isPresented: $loginModel.isAuthenticated){
                    MainView().navigationBarBackButtonHidden(true)
                }


            }
        }
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
