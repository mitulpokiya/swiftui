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

if item.done { 
  Text(item.text) 
    .strikethrough() 
} else { 
  Text(item.text)    
} 
