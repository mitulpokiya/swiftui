import SwiftUI

extension View { 
  @ViewBuilder 
  func `if`<Content: View>( 
    _ condition: @autoclosure () -> Bool, 
    transform: (Self) -> Content 
  ) -> some View { 
    if condition() { 
      transform(self) 
    } else { 
      self 
    } 
  } 
} 


//Use case

struct ContentView: View {
    @State private var isHighlighted = true

    var body: some View {
        Text("Hello, SwiftUI!")
            .font(.title)
            .if(isHighlighted) { view in
                view
                    .foregroundColor(.red)
                    .bold()
            }
            .padding()
            .onTapGesture {
                isHighlighted.toggle()
            }
    }
}
