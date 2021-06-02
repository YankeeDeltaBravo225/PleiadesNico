//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct PullDetector: View {

    let viewModel : PullDetectorViewModel
    
    var body: some View {
        GeometryReader { geometry -> Text in
            let frame       = geometry.frame(in: .global)
            let yCoordinate = frame.origin.y
            
            viewModel.update(yCoordinate)
            return Text("")
        }
    }
    
}


struct PullDetector_Previews: PreviewProvider {
    static var previews: some View {
        PullDetector(
            viewModel : PullDetectorViewModel(
                threshold: 50,
                onStart:  { print("pull started") },
                onFinish: { print("pull finished") }
            )
        )
    }
}
