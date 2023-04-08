//
//  HomeView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct HomeView: View {

  var body: some View {
    ScrollView {
      VStack {
        HomeTitleView(branchName: "프로그라피")
        
        HomeBannerView(banners: [.findYourTaste, .findYourTaste, .findYourTaste])
        
        RecommendationView()
        
        PromotionView()

        Spacer()
        
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}



struct HomeTitleView: View {
  @State var branchName: String

  var body: some View {
    HStack {
      Image("LogoImage")
        .frame(width: 32, height: 32)
      Spacer()
      Image("marker")
        .resizable()
        .frame(width: 16, height: 16)
      Text("스타벅스 \(branchName)점")
        .padding(.trailing, 20)
      Spacer()
    }
    .frame(height: 50)
    .padding(.horizontal, 20)
  }
}

struct HomeBannerView: View {
  @State var banners: [Banner.MainBanner]
  @State var currentPage: Int = 0

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(banners) { banner in
          if let image = banner.item.thumbnailImage {
            Image(uiImage: image)
              .resizable()
              .cornerRadius(10)
              .aspectRatio(contentMode: .fit)
              .padding(.horizontal, 20)
              .frame(width: UIScreen.screenWidth)
          }
        }
      }
    }
    .padding(.top, 20)


    PageControlView(currentPage: $currentPage, numberOfPages: banners.count)
      .padding(.bottom, 20)
  }
}

struct RecommendationView: View {
  var body: some View {
    VStack {
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
    }
  }
}

struct PromotionView: View {
  var body: some View {
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
  }
}
