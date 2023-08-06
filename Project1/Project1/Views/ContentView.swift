
import SwiftUI

struct TasksView: View {
    @ObservedObject var listTasks = TaskViewModel()
    
    @State var Searched: String = ""
    
    @State var showingSheets: Bool = false
    
    var lowListTaskData: Array<TaskData> {listTasks.taskData.filter({
        card in  card.priprity == .low
    })}
    var body: some View {
        NavigationStack{
            
            VStack {
                
                Picker("Select a proiroty", selection: $listTasks.textStatus)
                {
                    
                    Text("Backlog").tag(Status.backlog)
                    Text("to Do").tag(Status.toDo)
                    Text("In-Progress").tag(Status.inProgress)
                    Text("DONE").tag(Status.done)
                    
                }.pickerStyle(.segmented)
                    .cornerRadius(10)
                
                    .onChange(of: listTasks.textStatus, perform: listTasks.filtterStatus)
                
                Picker("Select a proiroty", selection: $listTasks.textPriprity)
                {
                    
                    Text("LOW").tag(Priority.low)
                    Text("MEDUIM").tag(Priority.medium)
                    Text("HIGH").tag(Priority.high)
                    
                }.pickerStyle(.segmented)
                    .cornerRadius(10)
                    .onChange(of: listTasks.textPriprity, perform: listTasks.filtterPriority)
                List{
                    Section{
                        ForEach(listTasks.filteredTaskData){
                            task in
                            NavigationLink(destination: {
                                TaskDetailsView(title: task.title, description: task.description, priority: task.priprity, status: task.status)
                                
                            },
                                           
                                           label:{
                                VStack{
                                    Text(task.title)
                                    Text(task.priprity.rawValue)
                                        .foregroundColor(task.priprity.color)
                                }})
                        }.onDelete{
                            offsets in listTasks.deleteTask(number:offsets)
                            
                        }
                        
                    }
                    
                }.searchable(text: $listTasks.searched, placement: .navigationBarDrawer(displayMode: .always))
                
                    .onChange(of: listTasks.searched, perform: listTasks.filteredTasksData)
                    .toolbar {
                        NavigationLink( destination: {
                            AddView(taskViewModel: listTasks)
                            
                            //                    showingSheets = true
                        },
                                        label:{
                            Image(systemName: "plus.app" )
                        })
                    }}
            
            
            .navigationTitle("Tasks view")
        }.onAppear{
            preformArray()
        }
        
        
    }
    
    
    func preformArray(){
        listTasks.filteredTaskData = listTasks.taskData
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
        
        
    }
}
