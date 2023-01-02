//
//  ListUpdateDeleteModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 2.1.23.
//

import SwiftUI

struct ListUpdateDeleteModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var listObject: ListViewModel
    @StateObject var modalObject = ModalViewModel()
    var body: some View {
        HStack(alignment: .center, spacing: 40){

            ZStack {
                Circle()
                    .stroke(.red, lineWidth: 2)
                .frame(width: 100, height: 100)
                Text(Image(systemName: "trash"))
                    .font(.system(size: 30))
                    .onTapGesture {
                        listObject.deleteList()
                    }
            }
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 2)
                .frame(width: 100, height: 100)
                Text(Image(systemName: "square.and.pencil"))
                    .font(.system(size: 30))
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                        modalObject.setTrue()
                    }
            }
        }.sheet(isPresented: $modalObject.isPresented, content: {
            UpdateListModalView(listObject: listObject)
                .presentationDetents([.height(300)])
        })
    }
}

struct ListUpdateDeleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        ListUpdateDeleteModalView(listObject: ListViewModel(listId: "0"))
    }
}
