//
//  UpdateUserModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 2.1.23.
//

import SwiftUI

struct UpdateUserModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var userObject: UserViewModel
    @StateObject private var modalObject = ModalViewModel()
    var body: some View {
        NavigationStack {
            ZStack {

                VStack(alignment: .center, spacing: 20.0) {
                    TextField("", text: $userObject.name, prompt: Text("Name")
                    )
                    .textFieldStyle(.roundedBorder)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 2))
                    .frame(width: 300)
                    .cornerRadius(20)

                    TextField("", text: $userObject.surname, prompt: Text("Surname")
                    )
                    .textFieldStyle(.roundedBorder)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 2))
                    .frame(width: 300)
                    .cornerRadius(20)

                    TextField("", text: $userObject.mail, prompt: Text("E-mail")
                    )
                    .textFieldStyle(.roundedBorder)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 2))
                    .frame(width: 300)
                    .cornerRadius(20)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.none)
                    HStack(spacing: 20.0){

                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            userObject.updateUser()




                        }, label: {
                            Text("Update")

                                .frame(width: 100)
                                .padding(.vertical, 1)
                                .foregroundColor(.white)



                        })
                        .tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(25)
                        .alert(isPresented: $userObject.isUpdated ){
                            Alert(title: Text("Done!"), message: Text("User is updated successfully!"), dismissButton: .default(Text("Ok")))

                        }

                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            modalObject.setFalse()


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

    struct UpdateUserModalView_Previews: PreviewProvider {
        static var previews: some View {
            UpdateUserModalView()
        }
    }
}
