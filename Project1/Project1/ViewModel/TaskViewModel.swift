
import Foundation
import SwiftUI

class TaskViewModel: ObservableObject{
    @AppStorage("Data") var taskData: [TaskData] = []
    @AppStorage("TextTitle") var textTitle: String = ""
    @AppStorage("TextDescription") var textDescription: String = ""
    @AppStorage("TextPriprity") var textPriprity: Priority  = .high
    @AppStorage("TextStatus") var textStatus: Status = .backlog
    @Published var filteredTaskData: [TaskData] = []
    
    @Published var searched: String = ""
    
    func filteredTasksData(value: String) {
        if value.isEmpty{
            filteredTaskData = taskData
        }
        else{
            //            print("i am here")
            let lowercase = value.lowercased()
            filteredTaskData = taskData.filter {
                $0.title.lowercased().contains(lowercase)
            }
        }
    }
    func addToList (title:String, description: String, priority: Priority, status: Status ){
        //        UserDefaults.standard.set(taskData,forKey: "Data")
        let addToArray = TaskData(id: UUID() , title: title, description: description, status: status, priority: priority)
        taskData.append(addToArray)
        print(addToArray)
    }
    func updateList (task: TaskData)
    {
        //        print("i am here")
            if let taskNumber = taskData.firstIndex(where: { $0.id.uuidString == task.id.uuidString}) {
                
                taskData[taskNumber] = task
            }
            else{
                print("error")
            }
        }
      
        
    
    func filtterStatus(status: Status){
        filteredTaskData = taskData.filter { i
            in i.status == status
            
        }
    }
    func filtterPriority(priority: Priority){
        filteredTaskData = taskData.filter { i
            in i.priprity == priority
            
        }
    }
    func deleteTask(number: IndexSet){
        print(number)
        taskData.remove(atOffsets: number)
    }
}
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            print("Init from result: \(result)")
            self = result
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        print("Returning \(result)")
        return result
    }
}










