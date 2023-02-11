
import SwiftUI

struct StarsView: View {
    @State var rating: CGFloat = 1.3
    var maxRating: Int = 5
    
    var body: some View {
        VStack {
            let stars = HStack(spacing: 0) {
                ForEach(0..<maxRating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            stars.overlay(
                GeometryReader { g in
                    let width = rating / CGFloat(maxRating) * g.size.width
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: width)
                            .foregroundColor(.yellow)
                    }
                }
                    .mask(stars)
            )
            .foregroundColor(.gray)
            Slider(value: $rating, in: 0...5, step: 0.1)
        }.background(.black)
    }
}
