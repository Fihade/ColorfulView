//
//  ColorfulView.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/27.
//

import SwiftUI

public struct ColorfulView: View {
    
    // MARK: - property
    @State var randomization: [PointRandomization]
    @State var size: CGSize = CGSize()
    
    @State var points: [RandomPoint]

    private let colorElements: [Color]
    private let animated: Bool
    private let animation: Animation
    private let blurRadius: CGFloat

    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    //MARK: - init
    public init(
        animated: Bool = defaultAnimated,
        animation: Animation = defaultAnimation,
        blurRadius: CGFloat = defaultBlurRadius,
        colors: [Color] = defaultColorList,
        colorCount: Int = defaultColorCount
    ) {
        assert(colors.count > 0)
        assert(colorCount > 0)
        assert(blurRadius > 0)
        
        self.animated = animated
        self.animation = animation
        self.blurRadius = blurRadius
        
        var colorCompiler = [Color]()
        while colorCompiler.count < colorCount {
            colorCompiler.append(contentsOf: colors.shuffled())
        }
        if colorCompiler.count > colorCount {
            colorCompiler.removeLast(colorCompiler.count - colorCount)
        }
        assert(colorCompiler.count == colorCount)
        colorElements = colorCompiler

        _randomization = State(initialValue: [PointRandomization](repeating: .init(), count: colorCount))
        
        _points = State(initialValue: [RandomPoint](repeating: .init(), count: colorCount))
    }

    //MARK: - VIEW
    public var body: some View {
        GeometryReader { reader in
            ZStack {
                ForEach(obtainRangeAndUpdate(size: reader.size), id: \.self) { idx in
                    Circle()
                        .foregroundColor(colorElements[idx])
                        .opacity(0.5)
                        .frame(width: randomization[idx].diameter,
                               height: randomization[idx].diameter)
                        .offset(x: randomization[idx].offsetX,
                                y: randomization[idx].offsetY)
                    
                }
            }
            .frame(width: reader.size.width, height: reader.size.height)
            
        }
        .clipped()
        .blur(radius: blurRadius)
        .onReceive(timer) { _ in
            dispatchUpdate()
        }
    }

    // MARK: - FUNCTION

    private func dispatchUpdate() {
        if !animated { return }
        withAnimation(animation) {
            randomizationStart()
        }
    }

    private func randomizationStart() {
        var randomizationBuilder = [PointRandomization]()
        while randomizationBuilder.count < randomization.count {
            let randomizationElement: PointRandomization = {
                var randomization = PointRandomization()
                randomization.randomizeIn(size: size)
                return randomization
            }()
            randomizationBuilder.append(randomizationElement)
        }
        randomization = randomizationBuilder
    }
    

    private func obtainRangeAndUpdate(size: CGSize) -> Range<Int> {
        issueSizeUpdate(withValue: size)
        return 0 ..< colorElements.count
    }

    private func issueSizeUpdate(withValue size: CGSize) {
        if self.size == size { return }
        DispatchQueue.main.async {
            self.size = size
            self.dispatchUpdate()
        }
    }
    
    
    // -------- //
    
    private func random() {
        var pointsBuilder = [RandomPoint]()
        while pointsBuilder.count < randomization.count {
            let point = RandomPoint(size: size)
            print("size: \(size)")
            print("point: \(point.offsetX)  \(point.offsetY)  \(point.radiusVal)")
            pointsBuilder.append(point)
        }
        points = pointsBuilder
    }
    
    private func update() {
        if !animated { return }
        withAnimation(animation) {
            random()
        }
    }
    
    private func getRandomPointsWith(size: CGSize) {
        if self.size == size { return }
        DispatchQueue.main.async {
            self.size = size
            self.update()
        }
    }
    
    private func obtain(size: CGSize) -> Range<Int> {
        getRandomPointsWith(size: size)
        return 0 ..< colorElements.count
    }
}
