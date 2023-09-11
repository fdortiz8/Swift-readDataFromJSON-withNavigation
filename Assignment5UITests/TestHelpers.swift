/*
#######################################################################
#
# Copyright (C) 2022-2023 David C. Harrison. All right reserved.
# Written by David C. Harrison
#
#######################################################################
*/

/*
#######################################################################
# Do not modify this helper class!
#######################################################################
*/

import XCTest

class TestHelpers {
  static func elementCount(app: XCUIApplication, text: String) -> Int {
    let predicate = NSPredicate(format: "label CONTAINS[c] %@", text)
    let elementQuery = app.staticTexts.containing(predicate)
    return elementQuery.count
  }
}
