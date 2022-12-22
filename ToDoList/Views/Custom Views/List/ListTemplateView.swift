//
//  ListTemplateView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 20.12.22.
//

import SwiftUI



struct ListTemplateView: View {

    @State var listName: String
    @State var taskCount: Int
    var body: some View {

        ZStack{
            Color(red: 232/255, green: 227/255, blue: 227/255)
                .ignoresSafeArea()
            CardShape(tl: 20, tr: 0, bl: 20, br: 20)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(radius: 5)
              

            HStack{

                Ellipse()


                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 50)


                Text(listName)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .offset(x: 50)





                
            }


            ZStack{
                    CardShape(tl: 0, tr: 0, bl: 30, br: 0)
                        .fill(Color(red: 60/255, green: 65/255, blue: 103/255))
                        .frame(width: 90, height: 30)
                        .offset(x: 131, y: -35)
                    Text(String(taskCount) + " " +  "Task")
                        .offset(x: 131, y: -35)
                        .foregroundColor(.white)


                }

        }


    }
}

struct ListTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        ListTemplateView(listName: "Daily List", taskCount: 5)

    }
}
