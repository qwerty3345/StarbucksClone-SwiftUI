//
//  OrderView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct OrderView: View {
    var body: some View {

        VStack {
            HStack {
                Spacer()
                Button(action: {

                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                }
                .frame(alignment: .trailing)
                .padding(.trailing, 24)

            }


            NavigationView {
                VStack {

                }
                .navigationTitle("주문하기")
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
