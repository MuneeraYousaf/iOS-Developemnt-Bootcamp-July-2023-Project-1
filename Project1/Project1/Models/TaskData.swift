

// This information of Task that include title, description, priorty that include (low, miduem, high), status that include (backlog, todo , in- progress ,and done)
import Foundation
import SwiftUI


struct TaskData: Identifiable, Codable {
//    static let exampl = TaskData(id: UUID(), title: "", description: "", status: .backlog, priority: .high)
    var id: UUID = UUID()
    let title: String
    let description: String
    let priprity: Priority
    let status: Status
    
    init( id: UUID, title: String, description: String, status: Status, priority: Priority) {
         self.title = title
         self.description = description
         self.status = status
        self.priprity = priority
     }
  
}


