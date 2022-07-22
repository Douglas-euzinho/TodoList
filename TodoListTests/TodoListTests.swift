//
//  TodoListTests.swift
//  TodoListTests
//
//  Created by Victor Brito on 18/07/22.
//

import XCTest
@testable import TodoList

class TodoListTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchActivities() throws {
        let persistenceController = PersistenceController(inMemory: true)
        let _ = persistenceController.createFood(name: "Food 1", type: "Food Type")
        let foods = persistenceController.fetchFoods()
        XCTAssertEqual(foods.count, 1)
    }
    
    func testCreateActivity() throws {
        let persistenceController = PersistenceController(inMemory: true)
        let food = persistenceController.createFood(name: "New Food", type: "Food Type")
        XCTAssertEqual(food.name, persistenceController.fetchFoods().first!.name)
    }
    
    func testDeleteActivity() throws {
        let persistenceController = PersistenceController(inMemory: true)
        let food = persistenceController.createFood(name: "Food Delete", type: "Food Type")
        XCTAssertEqual(persistenceController.fetchFoods().count, 1)
        persistenceController.delete(object: food)
        XCTAssertEqual(persistenceController.fetchFoods().count, 0)
    }
}
