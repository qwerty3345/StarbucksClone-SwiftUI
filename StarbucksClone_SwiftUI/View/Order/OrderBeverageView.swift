//
//  OrderBeverageView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/09.
//

import SwiftUI

struct OrderBeverageView: View {

  // MARK: - Properties

  var beverage: Beverage
  @State private var isHotSelected: Bool = false
  @State private var size: Size = .tall

  enum Size {
    case tall
    case grande
    case venti
  }

  private var alergyFactorText: String {
    guard beverage.allergyFactor.isEmpty == false else { return "없음" }
    return beverage.allergyFactor.reduce("") { result, factor in
      "\(result), \(factor.koreanName)"
    }
  }

  // MARK: - Body

  var body: some View {
    ScrollView {
      VStack {
        if let image = beverage.thumbnailImage {
          Image(uiImage: image)
            .resizable()
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        }

        VStack(alignment: .leading) {
          BeverageDescriptionView(beverage: beverage)

          HotIcePickerView(isHotSelected: $isHotSelected)

          if let descriptionCaution = beverage.descriptionCaution {
            BeverageCautionView(caution: descriptionCaution)
          }

          BeverageAlergyView(alergyFactorText: alergyFactorText)

          Text("사이즈 선택")
            .fontWeight(.semibold)

          Picker("선택", selection: $size) {
            Text("Tall")
              .tag(Size.tall)

            Text("Grande")
              .tag(Size.grande)

            Text("Venti")
              .tag(Size.venti)
          }
          .pickerStyle(.segmented)
          .cornerRadius(20)


        }
        .padding(.horizontal, 15)

        Spacer()


      }
    }
    .ignoresSafeArea()

  }
}

struct OrderBeverageView_Previews: PreviewProvider {
  static var previews: some View {
    OrderBeverageView(beverage: .recommend[2])
  }
}

struct BeverageDescriptionView: View {
  var beverage: Beverage

  var body: some View {
    Text(beverage.koreanName)
      .font(.title)
      .fontWeight(.semibold)
      .padding(.top, 10)

    Text(beverage.name)
      .font(.caption)
      .foregroundColor(.secondary)
      .padding(.top, 2)

    if let description = beverage.description {
      Text(description)
        .font(.body)
        .padding(.top, 6)
    }
  }
}

struct BeverageCautionView: View {
  var caution: String

  var body: some View {
    ZStack {
      Color.secondary.opacity(0.2)
        .cornerRadius(10)
      Text(caution)
        .font(.caption)
        .fontWeight(.light)
        .lineLimit(2)
    }
    .frame(height: 60)
    .padding(.top, 20)
  }
}

struct HotIcePickerView: View {
  @Binding var isHotSelected: Bool

  var body: some View {
    Picker("선택", selection: $isHotSelected) {
      Text("HOT")
        .tag(true)

      Text("ICED")
        .tag(false)
    }
    .pickerStyle(.segmented)
    .cornerRadius(20)
  }
}

struct BeverageAlergyView: View {
  var alergyFactorText: String

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("알레르기 유발 요인")
        .fontWeight(.semibold)
      Text(alergyFactorText)
        .font(.caption)
    }.padding(.top, 20)
  }
}
