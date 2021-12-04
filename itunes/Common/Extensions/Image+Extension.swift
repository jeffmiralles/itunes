//
//  Image+Extension.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/4/21.
//

import Foundation
import SwiftUI

extension Image {
    
    /// A placeholder image.
    /// Use this image when a true source for an image failed to load.
    static var placeholder: Self {
        Self.init("no-image-available")
    }
}
