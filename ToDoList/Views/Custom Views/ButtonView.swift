//
//  ButtonView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 19.12.22.
//

import SwiftUI

struct ButtonView: View {


    var body: some View {
        Button(action: {

        }, label: {
            Text("Login")
            
                .frame(width: 200)
                .padding(.vertical, 1)
                .foregroundColor(.white)
            
            
            
        })
        .tint(.blue)
        .buttonStyle(.borderedProminent)
        .cornerRadius(25)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
        
    }
}
