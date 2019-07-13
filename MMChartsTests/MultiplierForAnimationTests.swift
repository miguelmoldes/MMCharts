//
//  MultiplierForAnimationTests.swift
//  MMChartsTests
//
//  Created by MIGUEL MOLDES on 13/7/19.
//  Copyright © 2019 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import XCTest

@testable import MMCharts

class MultiplierForAnimationTests: XCTestCase {
    
    func testMultipliesList1() {
        let sut = MultiplierForAnimation()
        let fromList: [(CGFloat, CGFloat)] = [
//            (0.0,0.0),
            (10.0, 10.0),
            (15.0, 20.0),
            (20.0, 0.0)
        ]
        
        let toList: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 30.0),
            (20.0, 10.0),
            (30.0, 25.0)
        ]
        
        let result: [[(CGFloat,CGFloat)]] = sut.multiply(from: fromList, to: toList)
        
        let combination: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 20.0),
            (15.0, 20.0),
            (20.0, 5.0),
            (30.0, 25.0)
        ]
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0][0].0, fromList[0].0)
        XCTAssertEqual(result[0][1].0, fromList[1].0)
        XCTAssertEqual(result[0][2].0, fromList[2].0)
        XCTAssertEqual(result[0][0].1, fromList[0].1)
        XCTAssertEqual(result[0][1].1, fromList[1].1)
        XCTAssertEqual(result[0][2].1, fromList[2].1)
        
        XCTAssertEqual(result[1][0].0, combination[0].0)
        XCTAssertEqual(result[1][1].0, combination[1].0)
        XCTAssertEqual(result[1][2].0, combination[2].0)
        XCTAssertEqual(result[1][3].0, combination[3].0)
        XCTAssertEqual(result[1][4].0, combination[4].0)
        
        XCTAssertEqual(result[1][0].1, combination[0].1)
        XCTAssertEqual(result[1][1].1, combination[1].1)
        XCTAssertEqual(result[1][2].1, combination[2].1)
        XCTAssertEqual(result[1][3].1, combination[3].1)
        XCTAssertEqual(result[1][4].1, combination[4].1)
        
        XCTAssertEqual(result[2][0].0, toList[0].0)
        XCTAssertEqual(result[2][1].0, toList[1].0)
        XCTAssertEqual(result[2][2].0, toList[2].0)
        XCTAssertEqual(result[2][3].0, toList[3].0)
        
        XCTAssertEqual(result[2][0].1, toList[0].1)
        XCTAssertEqual(result[2][1].1, toList[1].1)
        XCTAssertEqual(result[2][2].1, toList[2].1)
        XCTAssertEqual(result[2][3].1, toList[3].1)
        
    }
    
    func testMultipliesList2() {
        let sut = MultiplierForAnimation()
        let fromList: [(CGFloat, CGFloat)] = [
            //            (0.0,0.0),
            (10.0, 10.0),
            (15.0, 20.0),
            (20.0, 0.0),
            (30.0, 25.0)
        ]
        
        let toList: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 30.0),
            (20.0, 10.0)
        ]
        
        let result: [[(CGFloat,CGFloat)]] = sut.multiply(from: fromList, to: toList)
        
        let combination: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 20.0),
            (15.0, 20.0),
            (20.0, 5.0),
            (30.0, 25.0)
        ]
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0][0].0, fromList[0].0)
        XCTAssertEqual(result[0][1].0, fromList[1].0)
        XCTAssertEqual(result[0][2].0, fromList[2].0)
        XCTAssertEqual(result[0][3].0, fromList[3].0)
        
        XCTAssertEqual(result[1][0].0, combination[0].0)
        XCTAssertEqual(result[1][1].0, combination[1].0)
        XCTAssertEqual(result[1][2].0, combination[2].0)
        XCTAssertEqual(result[1][3].0, combination[3].0)
        XCTAssertEqual(result[1][4].0, combination[4].0)
        
        XCTAssertEqual(result[2][0].0, toList[0].0)
        XCTAssertEqual(result[2][1].0, toList[1].0)
        XCTAssertEqual(result[2][2].0, toList[2].0)
        
        XCTAssertEqual(result[0][0].1, fromList[0].1)
        XCTAssertEqual(result[0][1].1, fromList[1].1)
        XCTAssertEqual(result[0][2].1, fromList[2].1)
        XCTAssertEqual(result[0][3].1, fromList[3].1)
        
        XCTAssertEqual(result[1][0].1, combination[0].1)
        XCTAssertEqual(result[1][1].1, combination[1].1)
        XCTAssertEqual(result[1][2].1, combination[2].1)
        XCTAssertEqual(result[1][3].1, combination[3].1)
        XCTAssertEqual(result[1][4].1, combination[4].1)
        
        XCTAssertEqual(result[2][0].1, toList[0].1)
        XCTAssertEqual(result[2][1].1, toList[1].1)
        XCTAssertEqual(result[2][2].1, toList[2].1)
        
    }
    
    func testMultipliesList3() {
        let sut = MultiplierForAnimation()
        let fromList: [(CGFloat, CGFloat)] = [
            //            (0.0,0.0),
            (10.0, 10.0),
            (15.0, 20.0),
            (20.0, 0.0)
        ]
        
        let toList: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 5.0),
            (20.0, 15.0),
            (30.0, 25.0)
        ]
        
        let result: [[(CGFloat,CGFloat)]] = sut.multiply(from: fromList, to: toList)
        
        let combination: [(CGFloat, CGFloat)] = [
            (0.0,10.0),
            (10.0, 7.5),
            (15.0, 10.0),
            (20.0, 7.5),
            (30.0, 25.0)
        ]
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0][0].0, fromList[0].0)
        XCTAssertEqual(result[0][1].0, fromList[1].0)
        XCTAssertEqual(result[0][2].0, fromList[2].0)
        
        XCTAssertEqual(result[1][0].0, combination[0].0)
        XCTAssertEqual(result[1][1].0, combination[1].0)
        XCTAssertEqual(result[1][2].0, combination[2].0)
        XCTAssertEqual(result[1][3].0, combination[3].0)
        XCTAssertEqual(result[1][4].0, combination[4].0)
        
        XCTAssertEqual(result[2][0].0, toList[0].0)
        XCTAssertEqual(result[2][1].0, toList[1].0)
        XCTAssertEqual(result[2][2].0, toList[2].0)
        XCTAssertEqual(result[2][3].0, toList[3].0)
        
        XCTAssertEqual(result[0][0].1, fromList[0].1)
        XCTAssertEqual(result[0][1].1, fromList[1].1)
        XCTAssertEqual(result[0][2].1, fromList[2].1)
        
        XCTAssertEqual(result[1][0].1, combination[0].1)
        XCTAssertEqual(result[1][1].1, combination[1].1)
        XCTAssertEqual(result[1][2].1, combination[2].1)
        XCTAssertEqual(result[1][3].1, combination[3].1)
        XCTAssertEqual(result[1][4].1, combination[4].1)
        
        XCTAssertEqual(result[2][0].1, toList[0].1)
        XCTAssertEqual(result[2][1].1, toList[1].1)
        XCTAssertEqual(result[2][2].1, toList[2].1)
        XCTAssertEqual(result[2][3].1, toList[3].1)
        
    }
    
}
