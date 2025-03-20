import SwiftUI

struct AnimationView: View {
    var animation: AnimationData
    @Binding var location: Double

    var currentAnimation: Animation {
        switch animation.type {
        case .easeIn:
            return Animation.easeIn(duration: animation.length)
        case .easeOut:
            return Animation.easeOut(duration: animation.length)
        case .easeInOut:
            return Animation.easeInOut(duration: animation.length)
        default:
            return Animation.linear(duration: animation.length)
        }
    }

    var body: some View {
        GeometryReader { proxy in
            Group {
                HStack {
                    Image(systemName: "gear.circle")
                        .rotationEffect(.degrees(360 * location))
                    Image(systemName: "star.fill")
                        .offset(x: proxy.size.width * location * 0.8)
                }
                .font(.title)
                .animation(currentAnimation, value: location)
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        let animation = AnimationData(type: .linear, length: 1.0, delay: 0.0)

        AnimationView(
            animation: animation,
            location: .constant(0.0)
        )
    }
}
