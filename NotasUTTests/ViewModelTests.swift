//
//  ViewModelTests.swift
//  NotasUTTests
//
//  Created by Marco Alonso Rodriguez on 11/01/24.
//

import XCTest
@testable import NotasUT

final class ViewModelTests: XCTestCase {
    var vm: ViewModel!
    
    override func setUpWithError() throws {
        vm = ViewModel()
    }

    override func tearDownWithError() throws {}
    
    func testCreateNote() {
        //Given
        let title = "Test Tilte"
        let text = "Text Test"
        
        //Then
        vm.createNoteWith(title: title, text: text)
        
        //When
        XCTAssertEqual(vm.notes.count, 1)
        XCTAssertEqual(vm.notes.first?.text, text)
        XCTAssertEqual(vm.notes.first?.title, title)
    }
    
    func testCreateThreeNotes() {
        //Given
        let title1 = "Test Tilte1"
        let text1 = "Text Test1"
        
        let title2 = "Test Tilte2"
        let text2 = "Text Test2"
        
        let title3 = "Test Tilte3"
        let text3 = "Text Test3"
        
        //Then
        vm.createNoteWith(title: title1, text: text1)
        vm.createNoteWith(title: title2, text: text2)
        vm.createNoteWith(title: title3, text: text3)
        
        //When
        XCTAssertEqual(vm.notes.count, 3)
        XCTAssertEqual(vm.notes.first?.text, text1)
        XCTAssertEqual(vm.notes.first?.title, title1)
        XCTAssertEqual(vm.notes[1].text, text2)
        XCTAssertEqual(vm.notes[1].title, title2)
        XCTAssertEqual(vm.notes[2].text, text3)
        XCTAssertEqual(vm.notes[2].title, title3)
    }

    func testUpdateNote() {
        //Given
        let title = "Test Tilte"
        let text = "Text Test"
        
        vm.createNoteWith(title: title, text: text)
        
        let newTitle = "New Test Tilte"
        let newText = "New Text Test"
        
        //When
        if let id = vm.notes.first?.id {
            vm.updateNoteWith(id: id, newTitle: newTitle, newText: newText)
            
            //Then
            XCTAssertEqual(vm.notes.first?.text, newText)
            XCTAssertEqual(vm.notes.first?.title, newTitle)
            
        } else {
            XCTFail("No note was created.")
        }
    }
    
    func testRemoveNote() {
        //Given
        
        let title = "Test Tilte"
        let text = "Text Test"
        
        vm.createNoteWith(title: title, text: text)
        
        //When
        if let id = vm.notes.first?.id {
            vm.removeNoteWith(id: id)
            
            //Then
            XCTAssertTrue(vm.notes.isEmpty)
        } else {
            XCTFail("Error deleting note.")
        }
        
        
    }

}
