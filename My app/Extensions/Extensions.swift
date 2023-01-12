//
//  Extensions.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/27.
//

import Foundation
import UIKit

/// Errors that can occur when playing a video.
public enum VideoBackgroundError: LocalizedError {
    /// Video with given name and type could not be found.
    case videoNotFound((name: String, type: String))

    /// Description of the error.
    public var errorDescription: String? {
        switch self {
        case . videoNotFound(let videoInfo):
            return "Could not find \(videoInfo.name).\(videoInfo.type)."
        }
    }
}
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    /// Apply strike font on text
    func strikeThrough() -> NSAttributedString {
      let attributeString = NSMutableAttributedString(string: self)
      attributeString.addAttribute(
        NSAttributedString.Key.strikethroughStyle,
        value: 1,
        range: NSRange(location: 0, length: attributeString.length))

        return attributeString
       }
    func removeStrikeThrough() -> NSAttributedString {
      let attributeString = NSMutableAttributedString(string: self)
        attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
       }
    
    
}
