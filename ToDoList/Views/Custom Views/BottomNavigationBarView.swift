//
//  BottomNavigationBarView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 14.12.22.
//

import SwiftUI

enum Tab: String, CaseIterable {

    case house
    case checklist
    case person
}

struct BottomNavigationBarView: View {
    @Binding var tabSelection: Tab
    private var fillImage: String {

        if(tabSelection.rawValue == "checklist"){
            return tabSelection.rawValue + ".checked"
        }

        return tabSelection.rawValue + ".fill"

    }
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tabSelection == tab ? fillImage : tab.rawValue)
                        .font(.system(size: 30))
                        .onTapGesture {
                            tabSelection = tab
                        }

                    Spacer()
                }

            }
            .frame(width: nil, height: 80)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 10)
           
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BottomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBarView(tabSelection: .constant(.checklist))
    }
}
