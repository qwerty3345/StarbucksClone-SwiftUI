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
          Image("Home")
            .renderingMode(.template)
          Text("홈")
        }

      OrderView()
        .tabItem {
          Image("Order")
            .renderingMode(.template)
          Text("주문")
        }

      MyMenuView()
        .tabItem {
          Image("MyMemu")
            .renderingMode(.template)
          Text("나의메뉴")
        }

      CartView()
        .tabItem {
          Image("Cart")
            .renderingMode(.template)
          Text("장바구니")
        }
    }
    .accentColor(Color("StarbucksGreen"))
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
