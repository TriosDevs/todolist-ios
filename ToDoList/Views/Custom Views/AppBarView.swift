//
//  AppBarView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 21.12.22.
//

import SwiftUI

struct AppBarView: View {
    @State var searchText = ""
    @State var appBarTitle: String
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text(appBarTitle)
                    .font(.system(size: 35, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                

                Spacer()



            }
            .shadow(radius: 10)


        }.padding()
         .background(Color(red: 88/255, green: 124/255, blue: 247/255))
        Spacer()

    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView(appBarTitle: "My Lists")
    }
}
