//
//  PageControllerView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct PageControlView: View {
  @Binding var currentPage: Int
  var numberOfPages: Int

  var body: some View {
    HStack {
      ForEach(0..<numberOfPages) { index in
        Circle()
          .frame(width: 8, height: 8)
          .foregroundColor(index == self.currentPage ? .accentColor : .gray)
          .onTapGesture(perform: { self.currentPage = index })
      }
    }
  }
}
