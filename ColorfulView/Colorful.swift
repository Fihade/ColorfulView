//
//  Colorful.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/27.
//

import SwiftUI

private let kDefaultSourceColorList = [#colorLiteral(red: 0, green: 0.3022235632, blue: 1, alpha: 1), #colorLiteral(red: 0.9707943797, green: 0.5372591615, blue: 0.8695508838, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]


public extension ColorfulView {
    static let defaultAnimated: Bool = true
    static let defaultBlurRadius: CGFloat = 64
    static let defaultColorCount: Int = 64

    static let defaultAnimation: Animation = Animation
        .interpolatingSpring(stiffness: 50, damping: 1)
        .speed(0.05)

    static let defaultColorList: [Color] = kDefaultSourceColorList
        .map { Color($0) }

    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        static let defaultColorListNSColor: [NSColor] = kDefaultSourceColorList
    #endif

    #if canImport(UIKit)
        static let defaultColorListUIColor: [UIColor] = kDefaultSourceColorList
    #endif
}
