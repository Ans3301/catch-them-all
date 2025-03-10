//
//  CatchThemAllUITests.swift
//  CatchThemAllUITests
//
//  Created by Мария Анисович on 05.03.2025.
//

import XCTest

final class CatchThemAllUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launch()
    }
    
    @MainActor
    func testCatchThemAll() throws {
        let app = XCUIApplication()
        
        let lightningView = app.otherElements["lightningView"]
        XCTAssertTrue(lightningView.exists, "View is not found.")
        
        let titleLabel = app.staticTexts["titleLabel"]
        XCTAssertTrue(titleLabel.exists, "Label is not found.")
        
        let collectionView = app.collectionViews["collectionView"]
        XCTAssertTrue(collectionView.exists, "CollectionView is not found.")
        
        let collectionViewCell = app.collectionViews.cells.element(boundBy: 0)
        XCTAssertTrue(collectionViewCell.exists, "Cell is not found.")
        collectionViewCell.tap()
        
        let nameLabel = app.staticTexts["nameLabel"]
        XCTAssertTrue(nameLabel.exists, "Label is not found.")
                
        let detailsView = app.otherElements["detailsView"]
        XCTAssertTrue(detailsView.exists, "View is not found.")
        
        let detailsValueView = app.otherElements["detailsValueView"]
        XCTAssertTrue(detailsValueView.exists, "View is not found.")
        
        let backButton = app.buttons["backButton"]
        XCTAssertTrue(backButton.exists, "Button is not found.")
        backButton.tap()
    }
}
