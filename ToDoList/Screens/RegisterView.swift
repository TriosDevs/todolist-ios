//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 6.12.22.
//

import SwiftUI

struct RegisterView: View {



    @StateObject private var registerModel = RegisterViewModel()
        
        
        

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
                        
                        
                        TextField("", text: $registerModel.name, prompt: Text("Name"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                        
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .autocapitalization(.none)
                        
                        
                        
                        TextField("", text: $registerModel.surname, prompt: Text("Surname"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        TextField("", text: $registerModel.mail, prompt: Text("Email"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        SecureField("", text: $registerModel.password, prompt: Text("Password"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1), width: 100)
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        
                        Button(action: {

                            registerModel.register()
                            
                        }, label: {
                            Text("Register")
                        })
                       
                        
                        
                    }
                }.navigationDestination(isPresented: $registerModel.isRegistered){
                    LoginView()
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
