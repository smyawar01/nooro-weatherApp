//
//  Theme.swift
//
//  Created by muhammad Yawar on 2/10/23.
//

import Foundation
import SwiftUI

struct Theme {
    
    struct AppFont {
        
        static var veryLargeTitle: Font { Font.system(size: 70, weight: .bold)  }
        static var largeTitle: Font { Font.system(size: 60, weight: .bold)  }
        static var title: Font { Font.system(size: 30, weight: .bold)  }
        static var title1: Font { Font.system(size: 20, weight: .semibold)  }
        static var description: Font { Font.system(size: 15, weight: .semibold) }
        static var title3: Font { Font.system(size: 12, weight: .medium) }
    }
    struct Spacing {
        
        static let base = 4.0
        static let condensed = base * 3
        static let standard = base * 4
        static let gutter = base * 5
        static let spacious = base * 6
        static let expanded = base * 8
    }
    struct CornerRadius {
        
        static let rectangleView = 16.0
    }
}
