import XCTest

import DHT11Tests

var tests = [XCTestCaseEntry]()
tests += DHT11Tests.allTests()
XCTMain(tests)
