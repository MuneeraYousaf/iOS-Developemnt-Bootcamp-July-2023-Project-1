//
//  TaskDetails.swift
//  Project1
//
//  Created by Muneera Y on 18/01/1445 AH.
//

import SwiftUI

struct TaskDetailsView: View {
    @ObservedObject var taskViewModel = TaskViewModel()
//    @State var task: TaskData
        @State var title:  String = ""
        @State var description: String = ""
        @State var priority: Priority = .low
        @State var showingdeitailes = false
        @State var status: Status = .backlog
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationStack{
            VStack{
                
                HStack {
                    Text("Title: ")
                    TextField(title, text: $title)
                }
                
                HStack {
                    Text("Description: ")
                    TextField(description, text: $taskViewModel.textDescription)
                }
                
                HStack {
                    Text("Priority: ")
//                    Text("\(priority.rawValue)")
                    Picker("Select a proiroty", selection: $taskViewModel.textPriprity)
                    {
                        
                        Text("LOW").tag(Priority.low)
                        Text("MEDUIM").tag(Priority.medium)
                        Text("HIGH").tag(Priority.high)
                        
                    }.pickerStyle(.segmented)
                    
                }
                
                HStack {
                    
                    Text("Status: ")
//                    Text("\(t.rawValue)")
                    Picker("Select a proiroty", selection: $taskViewModel.textStatus)
                    {
                        
                        Text("Backlog").tag(Status.backlog)
                        Text("to Do").tag(Status.toDo)
                        Text("In-Progress").tag(Status.inProgress)
                        Text("DONE").tag(Status.done)
                        
                    }.pickerStyle(.segmented)
                    
                }
                Button {
                    updateList()
                    dismiss()
                } label: {
                    Text("Update")
                }
                
                
            } 
        }
        .navigationTitle("Add New Task")
        
    }
    func updateList() {
        let updateTask = TaskData(id: UUID(), title: title, description: taskViewModel.textDescription, status: taskViewModel.textStatus, priority: taskViewModel.textPriprity)
        
        taskViewModel.updateList(task: updateTask)
//        dismiss()
    }
}




struct TaskDetails_Previews: PreviewProvider {
 
    static var previews: some View {
        TaskDetailsView()
    }
}
