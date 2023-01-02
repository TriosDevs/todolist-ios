//
//  UpdateTaskModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 3.1.23.
//

import SwiftUI

struct UpdateTaskModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var listObject = ListViewModel(listId: "0")
    var body: some View {
        ZStack {

            VStack(alignment: .center, spacing: 20.0) {
                TextField("", text: $listObject.name, prompt: Text("Update your list name!")
                )
                .textFieldStyle(.roundedBorder)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 2))
                .frame(width: 300)
                .cornerRadius(20)
                HStack(spacing: 20.0){

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        listObject.createList()


                    }, label: {
                        Text("Update")

                            .frame(width: 100)
                            .padding(.vertical, 1)
                            .foregroundColor(.white)



                    })
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(25)
                    .alert(isPresented: $listObject.isCreated ){
                        Alert(title: Text("Done!"), message: Text("List is created successfully!"), dismissButton: .default(Text("Ok")))

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
}

struct UpdateTaskModalView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTaskModalView()
    }
}
