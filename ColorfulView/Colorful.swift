//
//  Colorful.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/27.
//

import SwiftUI

private let kDefaultSourceColorList = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.6253449321, green: 0, blue: 0.8861384988, alpha: 1), #colorLiteral(red: 1, green: 0, blue: 0.988905251, alpha: 1), #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)]


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
