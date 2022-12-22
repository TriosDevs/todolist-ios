//
//  TaskItemView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 22.12.22.
//

import SwiftUI

struct TaskItemView: View {
    var body: some View {
        ZStack {
            CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                .fill(Color(red: 255/255, green: 243/255, blue: 97/255))
                .frame(width: 310, height: 50)

            Text("Hello world!")
                .font(.title2)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: 70)

            ZStack {
                Rectangle()
                    .stroke(.black, lineWidth: 1)
                    .background(.white)

                    .frame(width: 70, height: 50)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: -40)

                Rectangle()
                    .strokeBorder(.black, lineWidth: 1)

                    .frame(width: 25, height: 25)

                    .offset(x: 122)
            }



        }
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView()
    }
}
