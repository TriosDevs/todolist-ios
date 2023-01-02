//
//  TaskUpdateDeleteModalView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 3.1.23.
//

import SwiftUI

struct TaskUpdateDeleteModalView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 40){

            ZStack {
                Circle()
                    .stroke(.red, lineWidth: 2)
                .frame(width: 100, height: 100)
                Text(Image(systemName: "trash"))
                    .font(.system(size: 30))
            }
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 2)
                .frame(width: 100, height: 100)
                Text(Image(systemName: "square.and.pencil"))
                    .font(.system(size: 30))
            }
        }
    }
}

struct TaskUpdateDeleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        TaskUpdateDeleteModalView()
    }
}
