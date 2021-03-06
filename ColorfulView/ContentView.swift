//
//  ContentView.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/27.
//

import SwiftUI
extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                gradient: .init(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)).mask(self)
    }
}

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            ColorfulView()
                .cornerRadius(10)
                .ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
