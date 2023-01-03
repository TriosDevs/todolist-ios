//
//  TaskUpdateDeleteModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 3.1.23.
//

import SwiftUI

struct TaskUpdateDeleteModalView: View {
    @StateObject var taskObject: TaskViewModel
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
                        taskObject.deleteTask()
                    }
            }
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 2)
                .frame(width: 100, height: 100)
                Text(Image(systemName: "square.and.pencil"))
                    .font(.system(size: 30))
                    .onTapGesture {
                        modalObject.setUpdatedTrue()
                    }

            }
        }.sheet(isPresented: $modalObject.updateModal, content: {

            UpdateTaskModalView(taskObject: taskObject)
                .presentationDetents([.height(200)])
        })
    }
}

struct TaskUpdateDeleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        TaskUpdateDeleteModalView(taskObject: TaskViewModel(id: "0"))
    }
}
