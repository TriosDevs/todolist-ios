//
//  CreateTaskModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 29.12.22.
//

import SwiftUI

struct CreateTaskModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var taskObject: TaskViewModel
    var body: some View {
        ZStack {

            VStack(alignment: .center, spacing: 20.0) {
                TextField("", text: $taskObject.name, prompt: Text("Give a name to your task!")
                )
                .textFieldStyle(.roundedBorder)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 2))
                .frame(width: 300)
                .cornerRadius(20)
                HStack(spacing: 20.0){

                    Button(action: {

                        presentationMode.wrappedValue.dismiss()
                        taskObject.createTask()

                    }, label: {
                        Text("Create")

                            .frame(width: 100)
                            .padding(.vertical, 1)
                            .foregroundColor(.white)



                    })
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(25)
                    .alert(isPresented: $taskObject.taskIsCreated){
                        Alert(title: Text("Done!"), message: Text("Task is created successfully!"), dismissButton: .default(Text("Ok")))

                    }

                    Button(action: {

                        presentationMode.wrappedValue.dismiss()


                    }, label: {
                        Text("Cancel")

                            .frame(width: 100)
                            .padding(.vertical, 1)
                            .foregroundColor(.white)



                    })
                    .tint(.red)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(25)
                }
            }
        }
    }

    struct CreateTaskModalView_Previews: PreviewProvider {
        static var previews: some View {
            CreateTaskModalView(taskObject: TaskViewModel(id: "0"))
        }
    }
}
