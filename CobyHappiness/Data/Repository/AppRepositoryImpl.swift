//
//  AppRepositoryImpl.swift
//  CobyHappiness
//
//  Created by Coby on 6/25/24.
//

import Foundation
import SwiftData

final class AppRepositoryImpl: AppRepository {
    
    private let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(for: Bunch.self, Memory.self)
            self.container = try ModelContainer(for: Bunch.self, Memory.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    @MainActor
    func getMemoryById(id: UUID) async throws -> Memory {
        let descriptor = FetchDescriptor<Memory>(predicate: #Predicate { $0.id == id })
        return try self.container.mainContext.fetch(descriptor).first!
    }
    
    @MainActor
    func getMemories() async throws -> [Memory] {
        let descriptor = FetchDescriptor<Memory>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        return try self.container.mainContext.fetch(descriptor)
    }
    
    @MainActor
    func saveMemory(memory: Memory) async throws {
        self.container.mainContext.insert(memory)
        return try self.container.mainContext.save()
    }
    
    @MainActor
    func removeMemory(memory: Memory) async throws {
        self.container.mainContext.delete(memory)
    }
    
    @MainActor
    func getBunchById(id: UUID) async throws -> Bunch {
        let descriptor = FetchDescriptor<Bunch>(predicate: #Predicate { $0.id == id })
        return try self.container.mainContext.fetch(descriptor).first!
    }
    
    @MainActor
    func getBunches() async throws -> [Bunch] {
        let descriptor = FetchDescriptor<Bunch>(sortBy: [SortDescriptor(\.startDate, order: .reverse)])
        return try self.container.mainContext.fetch(descriptor)
    }
    
    @MainActor
    func saveBunch(bunch: Bunch) async throws {
        self.container.mainContext.insert(bunch)
        return try self.container.mainContext.save()
    }
    
    @MainActor
    func removeBunch(bunch: Bunch) async throws {
        self.container.mainContext.delete(bunch)
    }
}
