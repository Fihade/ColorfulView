//
//  view+innerShadow.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/28.
//

import SwiftUI

extension View {
    func innerShadow() -> some View {
        modifier(InnerShadow())
    }
}

private struct InnerShadow: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader {geo in
            content.overlay(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
        }
    }
}
