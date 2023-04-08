//
//  MainTabView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/07.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {

    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "house")
//          Image("house")
          Text("홈")
        }

      OrderView()
        .tabItem {
          Image(systemName: "cup.and.saucer")
//          Image("tumbler")
          Text("주문")
        }

      MyMenuView()
        .tabItem {
          Image(systemName: "heart.fill")
//          Image("heart")
          Text("나의메뉴")
        }

      CartView()
        .tabItem {
          Image(systemName: "cart.fill")
//          Image("basket")
//            .resizable()
//            .renderingMode(.original)
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 24, height: 24)
          Text("장바구니")
        }
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
