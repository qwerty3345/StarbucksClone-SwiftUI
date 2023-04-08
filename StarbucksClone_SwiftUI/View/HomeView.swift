//
//  HomeView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct HomeView: View {

  @State var currentPage: Int = 1

  var body: some View {
    ScrollView {
      VStack {
        HStack {
          Image("LogoImage")
            .frame(width: 32, height: 32)
          Spacer()
          Image("marker")
            .resizable()
            .frame(width: 16, height: 16)
          Text("스타벅스 프로그라피점")
            .padding(.trailing, 20)
          Spacer()
        }
        .frame(height: 50)
        .padding(.horizontal, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            ForEach(0..<3) { id in
              Image("MainBanner-1")
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20)
                .frame(width: UIScreen.screenWidth)
            }
          }
        }.padding(.top, 20)
        PageControlView(currentPage: $currentPage, numberOfPages: 3)
          .padding(.bottom, 20)
        
        
        
        HStack(spacing: 0) {
          Text("홍길동")
            .foregroundColor(.brown)
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
          Text("님을 위한 추천 메뉴")
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
          Spacer()
        }.padding(.leading, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
            ForEach(10..<15) { id in
              VStack {
                Image("Frame \(id)")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 110, height: 110)
                  .clipShape(Circle())
                Text("제주 비자림 콜드브루")
                  .multilineTextAlignment(.center)
                  .fixedSize(horizontal: false, vertical: true)
              }.frame(width: 112)
              
            }
          }.padding(.leading, 20)
        }
        
        HStack {
          Text("What's new")
            .font(.title2)
            .fontWeight(.medium)
          Spacer()
        }.padding(.leading, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
            ForEach(1..<5) { id in
              VStack(spacing: 6) {
                Image("LoveUs")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 144, height: 144)
                  .cornerRadius(10)
                Text("2023-03-21 ~ 2023-05-02")
                  .font(.system(size: 9))
                  .foregroundColor(.gray)
                  .frame(width: 144, alignment: .leading)
                Text("스타벅스 현대카드 3월 혜택")
                  .font(.system(size: 14))
                  .multilineTextAlignment(.center)
                  .frame(width: 144, alignment: .leading)
                  .fixedSize(horizontal: false, vertical: true)

              }
            }
          }.padding(.leading, 16)
        }
        
        
        
        
        Spacer()
        
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  @State static var currentPage = 0
  static var previews: some View {
    HomeView(currentPage: currentPage)
  }
}

struct PageControlView: View {
  @Binding var currentPage: Int
  @State var numberOfPages: Int

  var body: some View {
    HStack {
      ForEach(0..<numberOfPages) { index in
        Circle()
          .frame(width: 8, height: 8)
          .foregroundColor(index == self.currentPage ? Color("StarbucksGreen") : .gray)
          .onTapGesture(perform: { self.currentPage = index })
      }
    }
  }
}
