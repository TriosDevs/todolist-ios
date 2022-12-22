//
//  AppBarWithBackButtonView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 22.12.22.
//

import SwiftUI

struct AppBarWithBackButtonView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                })
                Text("My Tasks")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
            }.padding()
           
        }.background(Color(red: 88/255, green: 124/255, blue: 247/255))

    }
}

struct AppBarWithBackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarWithBackButtonView()
    }
}
