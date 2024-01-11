//
//  NotasUTTests.swift
//  NotasUTTests
//
//  Created by Marco Alonso Rodriguez on 11/01/24.
//

import XCTest
@testable import NotasUT

final class NoteTests: XCTestCase {

    func testNoteInitialization() {
        // Given or Arrange
        let title = "Title"
        let text = "Text Demo"
        let date = Date()
        
        //When or Act
        let note = Note(title: title, text: text, createdAt: date)
        
        //Then or Assert
        XCTAssertEqual(note.title, title)
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
    }


}
