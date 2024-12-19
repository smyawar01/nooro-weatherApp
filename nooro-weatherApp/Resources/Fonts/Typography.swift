//
//  Typography.swift
//  BigWishApp
//
//  Created by Mac on 18/09/2024.
//

import Foundation
import SwiftUI

struct AppFonts{
    static let InterBlack = "Poppins-Black"
    static let InterBlackItalic = "Poppins-BlackItalic"
    static let InterBold = "Poppins-Bold"
    static let InterBoldItalic = "Poppins-BoldItalic"
    static let InterExtraBold = "Poppins-ExtraBold"
    static let InterExtraBoldItalic = "Poppins-ExtraBoldItalic"
    static let InterExtraLight = "Poppins-ExtraLight"
    static let InterExtraLightItalic = "Poppins-ExtraLightItalic"
    static let InterItalic = "Poppins-Italic"
    static let InterLight = "Poppins-Light"
    static let InterLightItalic = "Poppins-LightItalic"
    static let InterMedium = "Poppins-Medium"
    static let InterMediumItalic = "Poppins-MediumItalic"
    static let InterRegular = "Poppins-Regular"
    static let InterSemiBold = "Poppins-SemiBold"
    static let InterSemiBoldItalic = "Poppins-SemiBoldItalic"
    static let InterThin = "Poppins-Thin"
    static let InterThinItalic = "Poppins-ThinItalic"
}

struct CustomAppFonts{
    static let PoppinsBlack = "Poppins-Black"
    static let PoppinsBlackItalic = "Poppins-BlackItalic"
    static let PoppinsBold = "Poppins-Bold"
    static let PoppinsBoldItalic = "Poppins-BoldItalic"
    static let PoppinsExtraBold = "Poppins-ExtraBold"
    static let PoppinsExtraBoldItalic = "Poppins-ExtraBoldItalic"
    static let PoppinsExtraLight = "Poppins-ExtraLight"
    static let PoppinsExtraLightItalic = "Poppins-ExtraLightItalic"
    static let PoppinsItalic = "Poppins-Italic"
    static let PoppinsLight = "Poppins-Light"
    static let PoppinsLightItalic = "Poppins-LightItalic"
    static let PoppinsMedium = "Poppins-Medium"
    static let PoppinsMediumItalic = "Poppins-MediumItalic"
    static let PoppinsRegular = "Poppins-Regular"
    static let PoppinsSemiBold = "Poppins-SemiBold"
    static let PoppinsSemiBoldItalic = "Poppins-SemiBoldItalic"
    static let PoppinsThin = "Poppins-Thin"
    static let PoppinsThinItalic = "Poppins-ThinItalic"
}

struct CustomFontModifier: ViewModifier {
    var fontName: String
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(fontName, size: size))
    }
}
