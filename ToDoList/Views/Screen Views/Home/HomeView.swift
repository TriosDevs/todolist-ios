//
//  HomeView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct HomeView: View {
    @State var isPresented = false

    @StateObject private var modalObject = ModalViewModel()
    var body: some View {
        ZStack{
            Color(red: 232/255, green: 227/255, blue: 227/255)
                .ignoresSafeArea()
            VStack(spacing: 30){
                AppBarView(appBarTitle: "Home")
                ZStack {
                    CardShape(tl: 20, tr: 20)
                        .fill(.white)
                        .frame(width: 350, height: 400)

                    ZStack{
                        CardShape(tl: 20, tr: 20)
                            .fill(Color(red: 60/255, green: 65/255, blue: 103/255))
                            .frame(width: 350, height: 80)
                            .offset(y: -220)
                        Ellipse()
                            .frame(width: 20, height: 20)
                            .offset(x: -140, y: -220)
                            .foregroundColor(.white)
                        Text("My List")
                            .foregroundColor(.white)
                            .font(.title2)
                            .offset(x: 80, y: -220)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    VStack{


                        TaskItemView()
                            .padding(.vertical, 5)
                        TaskItemView()
                            .padding(.vertical, 5)
                        TaskItemView()
                            .padding(.vertical, 5)
                        TaskItemView()
                            .padding(.vertical, 5)
                        TaskItemView()
                            .padding(.vertical, 5)

                    }
                }
                Spacer()
                HStack{
                    Text(Image(systemName: "plus"))
                        .font(.system(size: 30))
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.white)
                        .background(Color(red: 88/255, green: 124/255, blue: 247/255))
                        .clipShape(Circle())
                        .offset(x: 130, y: -75)
                        .onTapGesture {
                            modalObject.setTrue()
                        }
                }

            
            }
        }.sheet(isPresented: $modalObject.isPresented, content: {
            CreateListModalView()
                .presentationDetents([.height(200)])
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
