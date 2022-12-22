//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
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
                        Text("Name")
                            .font(.system(size: 25, weight: .bold))
                        Text("Surname")
                            .font(.system(size: 25, weight: .bold))
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

                    Button(action: {

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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
