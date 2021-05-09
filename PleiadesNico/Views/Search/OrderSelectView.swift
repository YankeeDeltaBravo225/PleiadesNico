//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct OrderSelectView: View {
    @ObservedObject var viewModel : SearchViewModel
    @State private var keyId      : Int? = 0
    @State private var orderId    : Int  = 0

    var body: some View {
        VStack {
            Text("検索順")
                .padding(10)
            Divider()
            List(selection: $keyId) {
                ForEach(viewModel.sortKeys, id:\.id) { key in
                    Text(key.description).tag(key.id)
                }
            }
            .frame(height:300)
            .environment(\.editMode, .constant(.active))

            if keyId != nil {
                Divider()
                let key = viewModel.sortKeys[keyId!]
                Picker(selection: $orderId, label: Text("")) {
                    Text(key.directions[0].description).tag(0)
                    Text(key.directions[1].description).tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                Divider()
            }

            Spacer()

        }
        .onAppear(){
            keyId = viewModel.keyId
            orderId  = viewModel.orderId
        }
        .onDisappear(){
            guard let keyId = self.keyId
            else {
                return
            }
            viewModel.updateSort(newKeyId: keyId, newOrderId: self.orderId)
        }
    }

}

struct OrderSelectView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSelectView( viewModel : SearchViewModel() )
    }
}
