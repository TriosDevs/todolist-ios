//
//  ListView.swift
//  ToDoList
//
//  Created by Ardi Jorganxhi on 8.12.22.
//

import SwiftUI

struct ListView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject private var listObject = ListViewModel(listId: "0")
    @StateObject private var modalObject = ModalViewModel()
    @State var isPresented = false


    


    var body: some View {
        NavigationStack {
            ZStack{
                
                Color(red: 232/255, green: 227/255, blue: 227/255)
                    .ignoresSafeArea()
                    .onTapGesture {
                        self.isPresented = false
                    }
                
                
                
                
                VStack(){
                    AppBarView(appBarTitle: "My Lists")
                    
                    
                    
                    
                    
                    ScrollView {
                        ForEach(listObject.listData) {list in
                            
                            
                            
                            ListTemplateView(listName: list.name, taskCount: 5)
                                .navigationDestination(isPresented: $listObject.navigateTask){
                                    TaskView(listId: String(list.id!))
                                }
                                .sheet(isPresented: $modalObject.isPresented2, content: {
                                    ListUpdateDeleteModalView(listObject: ListViewModel(listId: String(list.id!)))
                                        .environmentObject(modalObject)
                                        .presentationDetents([.height(300)])
                                    
                                    
                                })
                                .onTapGesture {
                                    listObject.goToTask()
                                }
                                .onLongPressGesture{
                                    modalObject.setTrue2()
                                }
                            
                            
                            
                            
                            
                            
                        }
                    }
                    
                    
                    HStack{
                        Text(Image(systemName: "plus"))
                            .font(.system(size: 30))
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.white)
                            .background(Color(red: 88/255, green: 124/255, blue: 247/255))
                            .clipShape(Circle())
                            .offset(x: 130, y: -75)
                            .onTapGesture {
                                modalObject.setTrue()
                            }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
            }.onAppear{
                listObject.getList()
            }
            .onDisappear{
                listObject.deletelistData()
            }
            .sheet(isPresented: $modalObject.isPresented, content: {
                CreateListModalView()
                    .presentationDetents([.height(200)])
            })
            
            
            
        }
    
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
