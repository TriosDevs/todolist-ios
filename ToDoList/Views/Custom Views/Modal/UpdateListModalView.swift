//
//  UpdateListModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 3.1.23.
//

import SwiftUI

struct UpdateListModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject  var listObject: ListViewModel
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
                        listObject.updateList()
                        listObject.getList()


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

    struct UpdateListModalView_Previews: PreviewProvider {
        static var previews: some View {
            UpdateListModalView(listObject: ListViewModel(listId: "0"))
        }
    }
}
