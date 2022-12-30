//
//  TaskView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 22.12.22.
//

import SwiftUI

struct TaskView: View {

    @StateObject private var modalObject = ModalViewModel()

    @StateObject var taskObject = TaskViewModel(listId: "0")
    @State var listId: String








    var body: some View {

        
        NavigationStack {
            ZStack{
                Color(red: 232/255, green: 227/255, blue: 227/255)
                    .ignoresSafeArea()

                VStack {

                    AppBarWithBackButtonView().navigationBarBackButtonHidden(true)

                    Spacer()

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
                            Text(taskObject.name)
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







            }.sheet(isPresented: $modalObject.isPresented){
                CreateTaskModalView(taskObject: TaskViewModel(listId: listId))
                    .presentationDetents([.height(200)])
            }
        }
    }
    }


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(listId: "0")

    }
}
