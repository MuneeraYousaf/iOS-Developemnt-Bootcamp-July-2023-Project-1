

import Foundation
import SwiftUI
enum Priority: String, CaseIterable, Codable{
    case low
    case medium
    case high
    
    var color : Color {
        
        switch self {
        case .low:
            return .yellow
        case .medium:
            return .orange
        case .high :
            return .red
        }
    }
    
}
