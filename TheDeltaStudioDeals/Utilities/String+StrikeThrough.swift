//
//  String+StrikeThrough.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import Foundation



public extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:  "$" + self )
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
