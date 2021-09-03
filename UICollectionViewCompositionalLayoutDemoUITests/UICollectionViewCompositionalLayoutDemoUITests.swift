//
//  UICollectionViewCompositionalLayoutDemoUITests.swift
//  UICollectionViewCompositionalLayoutDemoUITests
//
//  Created by Alonso on 8/29/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest

class UICollectionViewCompositionalLayoutDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testLayouts() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.activate()
        
        let cells = app.tables.cells
        
        for i in 0...cells.count - 1 {
            cells.element(boundBy: i).tap()
            
            let layoutCells = app.collectionViews.cells
            
            XCTAssert(layoutCells.count > 0)

            let collectionView = app.collectionViews.firstMatch
            let startPoint = collectionView.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            let endPoint = collectionView.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.5))
            startPoint.press(forDuration:1.0, thenDragTo:endPoint);
            
            snapshot(app.navigationBars.firstMatch.identifier)
            
            app.navigationBars.buttons.element(boundBy: 0).tap()
        }
    }
    
}
