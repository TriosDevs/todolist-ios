//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 6.12.22.
//

import SwiftUI

struct RegisterView: View {
    @State var input: String = ""
    @State var registerInput = RegisterModel()
    @State var isRegistered: Bool = false
    
    var postUrl = "http://todolist-api.oguzhanercelik.dev/auth"
    func postData(){
        
        guard let url = URL(string: postUrl) else {return}
        
        let body: [String: AnyHashable] = ["name": registerInput.name, "surname": registerInput.surname, "mail": registerInput.mail, "password": registerInput.password]
        
        let finalData = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            
            guard let data = data, err == nil else {
                return
            }
            do{
                let res = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                print(res)
                
                
                if let res = res as? HTTPURLResponse{
                    print(res.statusCode)
                }
               
                
                  
                
               
            }
            catch {
                print(err)
            }
            
        }.resume()
        
        
        
    }
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
                        
                        
                        TextField("", text: $registerInput.name, prompt: Text("Name"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                        
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .autocapitalization(.none)
                        
                        
                        
                        TextField("", text: $registerInput.surname, prompt: Text("Surname"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        TextField("", text: $registerInput.mail, prompt: Text("Email"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1))
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        SecureField("", text: $registerInput.password, prompt: Text("Password"))
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                            .border(Color(red: 88.0, green: 124.0, blue: 247.0, opacity: 1), width: 100)
                            .cornerRadius(15.0)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        
                        
                        Button(action: {
                          
                           postData()
                        }, label: {
                            Text("Register")
                        })
                       
                        
                        
                    }
                }.navigationDestination(isPresented: $isRegistered){
                    LoginView()
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
