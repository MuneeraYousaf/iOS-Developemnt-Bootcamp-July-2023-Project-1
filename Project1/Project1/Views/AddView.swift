

import SwiftUI

struct AddView: View {
    @ObservedObject var taskViewModel = TaskViewModel()
    @State private var newToDo = ""
    @State var priorityChoice = "Options"
//    @Binding var showingSheet: Bool
    @State var Searched:String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack
        {
           
        
            TextField("Title", text: $taskViewModel.textTitle)
            
            TextField("Description", text: $taskViewModel.textDescription)
        
      
                
                Picker("Select a proiroty", selection: $taskViewModel.textPriprity)
                {
                   
                    Text("LOW").tag(Priority.low)
                    Text("MEDUIM").tag(Priority.medium)
                    Text("HIGH").tag(Priority.high)
                    
                }.pickerStyle(.segmented)
            Picker("Select a proiroty", selection: $taskViewModel.textStatus)
            {
               
                Text("Backlog").tag(Status.backlog)
                Text("to Do").tag(Status.toDo)
                Text("In-Progress").tag(Status.inProgress)
                Text("DONE").tag(Status.done)
                
            }.pickerStyle(.segmented)
            Button {
                taskViewModel.addToList(title: taskViewModel.textTitle, description: taskViewModel.textDescription, priority: taskViewModel.textPriprity, status: taskViewModel.textStatus)
                
                taskViewModel.textTitle = ""
                taskViewModel.textDescription = ""
                taskViewModel.textPriprity = .low
                taskViewModel.textStatus = .backlog
//                showingSheet = true
                dismiss()
            } label: {
                Text("ADD")
            }
          
//            Button {
//                dismiss()
//            } label: {
//                Text("Go Back")
//            }
//            .sheet(isPresented: $showingSheet) {
//                print("Sheet dismissed!")
//            } content:{
//
//                TasksView()
//            }
          
        }.onChange(of: taskViewModel.textTitle){
            newValue in validateNumber(newValue)
        }
        .navigationBarBackButtonHidden(true)
    
    }
    func validateNumber (_ value: String)
    {
        if value.isEmpty {
           print("mmmm")
        }
    }
    
    
}


struct AddView_Previews: PreviewProvider {
    @State var showingSheets: Bool = false
    
    static var previews: some View {
        AddView()
    }
}
