import SwiftUI

extension View { 
  public func popUp<V>( 
    isPresented: Binding<Bool>, 
    @ViewBuilder content: @escaping () -> V 
  ) -> some View where V: View { 
    self 
      .blur(radius: isPresented.wrappedValue ? 4 : 0.0) 
      .overlay { 
        if isPresented.wrappedValue { 
          ZStack { 
            Color(.gray) 
              .edgesIgnoringSafeArea(.all) 
              .opacity(0.8) 
              .onTapGesture { 
                isPresented.wrappedValue = false 
              } 
            VStack { 
              Spacer() 
              content() 
              Spacer() 
            } 
          } 
          .frame(height: UIScreen.main.bounds.height) 
        } 
      } 
    } 
} 
