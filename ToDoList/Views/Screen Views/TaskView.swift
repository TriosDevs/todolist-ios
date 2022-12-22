//
//  TaskView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 22.12.22.
//

import SwiftUI

struct TaskView: View {


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
                            Text("My List")
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
                } 







            }
        }
    }
    }


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()

    }
}
