//
//  ListView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct ListView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject private var listObject = ListViewModel()


    


    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 232/255, green: 227/255, blue: 227/255)
                    .ignoresSafeArea()


                VStack(){
                    AppBarView(appBarTitle: "My Lists")



                    ScrollView{

                        ForEach(listObject.listData) {list in

                            VStack(spacing: 16.0) {
                                ListTemplateView(listName: list.name!, taskCount: 5)
                            }
                        }


                        }
                    

                    Button(action: {
                        print("Round Action")
                    }) {
                        Text(Image(systemName: "plus"))
                            .font(.system(size: 30))
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.white)
                            .background(Color(red: 88/255, green: 124/255, blue: 247/255))
                            .clipShape(Circle())
                            .offset(x: 130, y: -75)
                    }

                }
            }
        }.onAppear{
            listObject.getList()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
