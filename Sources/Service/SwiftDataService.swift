//
//  LocalStoreService
//  TimePot
//
//  Created by Yujin Kim on 2024-04-05.
//  

import Foundation
import SwiftData

@available(iOS 17, macOS 14, macCatalyst 17, watchOS 10, *)
final class SwiftDataService {
    static let shared = SwiftDataService()
    
    var container = try? ModelContainer(for: Mode.self, TimeRecord.self)
    
    private init() {}
    
    @MainActor
    func fetchDatasource() -> [Mode] {
        let descriptor = FetchDescriptor<Mode>()
        
        if let datasource = try? self.container?.mainContext.fetch(descriptor) {
            return datasource
        } else {
            return []
        }
    }
    
    @MainActor
    func createMode(to name: String) {
        let mode = Mode(name: name, total: .now, createAt: .now)
        
        do {
            self.container?.mainContext.insert(mode)
            
            try self.container?.mainContext.save()
        } catch let error {
            debugPrint("\(error.localizedDescription)")
        }
    }
    
    @MainActor
    func updateMode(to total: Date) {
        let descriptor = FetchDescriptor<Mode>()
    }
    
    @MainActor
    func deleteMode(mode: Mode) {
        do {
            self.container?.mainContext.delete(mode)
            
            try self.container?.mainContext.save()
        } catch let error {
            debugPrint("\(error.localizedDescription)")
        }
    }
}
