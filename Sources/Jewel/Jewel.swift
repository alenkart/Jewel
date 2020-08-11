import SwiftUI

// ShimmerView
public struct ShimmerView: View {
    @State var show: Bool = false
    
    let speed: Double
    let angle: Angle
    
    var gradient: LinearGradient {
        let leading = Gradient.Stop(color: .clear, location: 0.35)
        let center = Gradient.Stop(color: Color.white.opacity(0.7), location: 0.45)
        let trailing = Gradient.Stop(color: .clear, location: 0.55)
        
        return LinearGradient(
            gradient: .init(stops: [leading, center, trailing]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var animation: Animation {
        Animation
            .default
            .speed(0.15)
            .delay(0)
            .repeatForever(autoreverses: false)
    }
    
   public var body: some View {
        GeometryReader { geo in
            Color.white
                .mask(Rectangle().fill(self.gradient))
                .padding(-self.calcSize(geo))
                .rotationEffect(self.angle)
                .offset(x: self.calcOffset(geo), y: 0)
                .animation(self.animation)
        }.onAppear {
            self.show.toggle()
        }
    }
    
    init(speed: Double, angle: Angle) {
        self.speed = speed
        self.angle = angle
    }
    
    func calcOffset(_ geo: GeometryProxy) -> CGFloat {
        let size = calcSize(geo)
        return (self.show ? size : -size) * 2
    }
    
    func calcSize(_ geo: GeometryProxy) -> CGFloat {
        return max(geo.size.width, geo.size.height)
    }
}

// ShimmerModifier
public struct ShimmerModifier: ViewModifier {
    let isActive: Bool
    let speed: Double
    let angle: Angle
    
    public func body(content: Content) -> some View {
        if(!isActive) { return AnyView(content) }
        
        let view = content
            .opacity(0.3)
            .overlay(
                ShimmerView(
                    speed: speed,
                    angle: angle
                ).mask(content)
        )
        
        return AnyView(view)
    }
}

extension View {
    
   public func shimmer(
        isActive: Bool = true,
        speed: Double = 0.15,
        angle: Angle = .init(degrees: 70)
    ) -> some View {
        
        let view = ShimmerModifier(
            isActive: isActive,
            speed: speed,
            angle: angle
        )
        
        return self.modifier(view)
    }
    
}
