# Jewel 💎
![Logo](https://raw.githubusercontent.com/alenkart/Jewel/master/docs/jewel.svg)

Shimmer animation in pure SwiftUI. To start the effect just call ```.shimmer()``` extension method.
![Example](https://raw.githubusercontent.com/alenkart/Jewel/master/docs/example.gif)

## Examples
```
Text("Loading...")
.shimmer()

Rectangle()
.fill()
.frame(height: 50)
.cornerRadius(20)
.shimmer(isActive: true, speed: 0.15, angle: .init(degrees: 70))
```

### These guys are the real MVP
https://github.com/Vidhyadharan24/ShimmerView

https://www.youtube.com/watch?v=SvcKjnkprN8&t=296s
