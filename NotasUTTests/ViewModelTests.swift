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
    
    


}
