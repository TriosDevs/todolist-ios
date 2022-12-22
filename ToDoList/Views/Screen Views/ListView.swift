//
//  ListView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct ListView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {

            HStack{
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .offset(y: 55)
            }

        })
    }
    var lists: [ListModel] = listData
    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 232/255, green: 227/255, blue: 227/255)
                    .ignoresSafeArea()


                VStack(spacing: 30){
                    AppBarView(appBarTitle: "My Lists")



                    ScrollView{
                        ForEach(lists) { list in

                            NavigationLink(destination: TaskView()) {
                                ListTemplateView(listName: list.name, taskCount: 5)
                                    
                                    .padding(.vertical, 16)

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
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
