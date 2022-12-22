//
//  TaskTemplateView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 22.12.22.
//

import SwiftUI



struct TaskTemplateView: View {
    var body: some View {
        ZStack {
            Color(red: 232/255, green: 227/255, blue: 227/255)
                .ignoresSafeArea()
            CardShape(tl: 20, tr: 20)
                .fill(.white)
                .frame(width: 350, height: 500)

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

            ZStack{

                VStack(spacing: 20) {

                    ZStack {
                        CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                            .fill(.yellow)
                            .frame(width: 310, height: 50)

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
                    ZStack {
                        CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                            .fill(.yellow)
                            .frame(width: 310, height: 50)

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
                    ZStack {
                        CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                            .fill(.yellow)
                            .frame(width: 310, height: 50)


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
                    ZStack {
                        CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                            .fill(.yellow)
                            .frame(width: 310, height: 50)


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
                    ZStack {
                        CardShape(tl: 40, tr: 40, bl: 40, br: 40)
                            .fill(.yellow)
                            .frame(width: 310, height: 50)

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

        }
    }
}

struct TaskTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TaskTemplateView()
    }
}
