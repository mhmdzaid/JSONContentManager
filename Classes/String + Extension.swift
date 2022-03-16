//
//  String + Extension.swift
//  JSONContentManager
//
//  Created by Mohamed Zead on 16/03/2022.
//

import Foundation

extension String {
    /**
     Replaces placeholder indicators with array you provide
     - Parameter placeholders: placeholders array with any type to be replaced
     */
    mutating func apply(_ placeholders: [Any]) {
        for (index, placeholder) in placeholders.enumerated() {
            self = self.replacingOccurrences(of: "{\(index)}", with: "\(placeholder)")
        }
    }
}
