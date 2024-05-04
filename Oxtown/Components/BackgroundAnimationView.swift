//
//  BackgroundAnimationView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct BackgroundAnimationView: View {
    @State private var progress = 0.0
    let gradient1 = Gradient(colors: [.bgPurple, .mountainGreen])
    let gradient2 = Gradient(colors: [.mountainGreen, .sakura])
    
    var body: some View {
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 4).repeatForever(autoreverses: true)) { self.progress = 0.8 }
        }
    }
}

extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}

struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get {progress}
        set{progress = newValue}
    }
    
    func body(content: Content) -> some View {
        var gradientColors = [Color]()
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing)
    }
    
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
        guard let fromColor = fromColor.cgColor.components else { return Color(fromColor)}
        guard let toColor = toColor.cgColor.components else { return Color(toColor)}
        
        let r = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let g = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let b = fromColor[2] + (toColor[2] - fromColor[2]) * progress
        
        return Color(red: Double(r), green: Double(g), blue: Double(b))
    }
    
}

#Preview {
    BackgroundAnimationView()
        .preferredColorScheme(.light)
}
