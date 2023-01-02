//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var UserModel: UserViewModel
    @StateObject private var ModalObject = ModalViewModel()


    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 232/255, green: 227/255, blue: 227/255)
                    .ignoresSafeArea()
                VStack{
                    AppBarView(appBarTitle: "My Profile")

                    ZStack{
                        CardShape(tl: 20, tr: 20, bl: 20, br: 20)
                            .fill(.white)
                            .frame(width: 320, height: 400)
                            .shadow(radius: 5)
                        ZStack {
                            Circle()
                                .fill(Color(red: 60/255, green: 65/255, blue: 103/255))
                                .frame(width: 150, height: 150)
                                .offset(y: -200)
                            .shadow(radius: 5)

                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .font(.system(size: 55))
                                .offset(y: -200)
                        }
                        HStack{
                            ForEach(UserModel.userData) { user in
                                Text(user.firstName)
                                    .font(.system(size: 25, weight: .bold))
                                Text(user.lastName)
                                    .font(.system(size: 25, weight: .bold))
                            }
                        }.offset(y: -100)

                        ZStack{
                            CardShape(tl: 0, tr: 20, bl: 0, br: 20)
                                .fill(Color(red: 60/255, green: 65/255, blue: 103/255))
                                .frame(width: 110, height: 30)
                            Text("Email")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))

                        }.offset(x: -105)

                        ZStack{
                            CardShape(tl: 0, tr: 20, bl: 0, br: 20)
                                .fill(Color(red: 60/255, green: 65/255, blue: 103/255))
                                .frame(width: 110, height: 30)
                            Text("Password")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                        }.offset(x: -105, y: 50)

                        ZStack{
                            ForEach(UserModel.userData){ user in

                                Text(verbatim: user.mail)
                                    .frame(width: 200)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.none)

                            }


                        }.offset(x: 50)

                        Button(action: {
                            ModalObject.setTrue()
                        }, label: {
                            Text("Update")
                                .frame(width: 100)

                                .foregroundColor(.white)
                        })
                        .tint(.yellow)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(25)
                        .offset(x: 80, y: 160)

                    }
                    Spacer()
                }
            }.onAppear{
                UserModel.getUser()
            }
            .sheet(isPresented: $ModalObject.isPresented){
                UpdateUserModalView()
                    .presentationDetents([.height(300)])
        }
        }.navigationDestination(isPresented: $UserModel.isSignedOut){
            LoginView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
