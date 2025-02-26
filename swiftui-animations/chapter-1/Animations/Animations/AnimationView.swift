import SwiftUI

struct AnimationView: View {
  var animation: AnimationData
  @Binding var location: Double

  var body: some View {
    GeometryReader { proxy in
      Group {
        Text("Animation")
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
