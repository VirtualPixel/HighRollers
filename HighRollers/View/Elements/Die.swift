//
//  Dice.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI

struct Die: View, Identifiable {
    var id = UUID()
    var result = Int.random(in: 1...10)
    var isNumeric = false
    let dieColor = Color.whiteDie
    
    var body: some View {
        GeometryReader { geo in
            LinearGradient(colors: dieColor, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: geo.size.width, height: geo.size.width)
                .overlay(
                    RoundedRectangle(cornerRadius: (geo.size.width * 0.25))
                        .fill(Color.whiteDieShadow)
                        .padding(geo.size.width * 0.07)
                        .shadow(color: Color.whiteDieShadow, radius: geo.size.width * 0.03)
                        .shadow(color: Color.whiteDieShadow, radius: 0)
                        .shadow(color: Color.whiteDieShadow, radius: 0)
                        .shadow(color: Color.whiteDieShadow, radius: 0)
                        .frame(width: geo.size.width, height: geo.size.width)
                        .overlay(
                            RoundedRectangle(cornerRadius: geo.size.width * 0.1).stroke(Color.black, lineWidth: (geo.size.width * 0.025))
                            .frame(width: geo.size.width, height: geo.size.width)
                            .clipShape(RoundedRectangle(cornerRadius: (geo.size.width * 0.10)))
                        )
                        .overlay(
                            DieResult(number: result, isNumeric: isNumeric, dotWidth: geo.size.width * 0.2)
                        )
                    
                )
                .clipShape(RoundedRectangle(cornerRadius: (geo.size.width * 0.10)))
        .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
    }
}

struct Die_Previews: PreviewProvider {
    static var previews: some View {
        Die(result: 1)
    }
}

struct DieResult: View {
    let number: Int
    let isNumeric: Bool
    let dotWidth: CGFloat
    
    var body: some View {
            Group {
                if isNumeric {
                    Text("\(number)")
                        .foregroundColor(.black)
                } else {
                    dotsForNumber(number)
                }
            }
            .font(.system(size: 1000))
            .minimumScaleFactor(0.005)
            .font(.title).bold()
            .padding(dotWidth * 0.7)
        }

    func dotsForNumber(_ number: Int) -> some View {
            switch number {
            case 1:
                return AnyView(dot())
            case 2:
                return AnyView(two())
            case 3:
                return AnyView(three())
            case 4:
                return AnyView(four())
            case 5:
                return AnyView(five())
            case 6:
                return AnyView(six())
            default:
                return AnyView(Text("\(number)")
                    .foregroundColor(.black))
            }
        }
    
    @ViewBuilder func two() -> some View {
        VStack {
            HStack {
                Spacer()
                dot()
            }
            
            Spacer()
            
            HStack {
                dot()
                Spacer()
            }
        }
    }
    
    @ViewBuilder func three() -> some View {
        VStack {
            HStack {
                Spacer()
                dot()
            }
            
            Spacer()
            dot()
            Spacer()
            
            HStack {
                dot()
                Spacer()
            }
        }
    }
    
    @ViewBuilder func four() -> some View {
        VStack {
            HStack {
                dot()
                Spacer()
                dot()
            }
            
            Spacer()
            
            HStack {
                dot()
                Spacer()
                dot()
            }
        }
    }
    
    @ViewBuilder func five() -> some View {
        VStack {
            HStack {
                dot()
                Spacer()
                dot()
            }
            
            Spacer()
            dot()
            Spacer()
            
            HStack {
                dot()
                Spacer()
                dot()
            }
        }
    }
    
    @ViewBuilder func six() -> some View {
        VStack {
            HStack {
                dot()
                Spacer()
                dot()
                Spacer()
                dot()
            }
            
            Spacer()
            
            HStack {
                dot()
                Spacer()
                dot()
                Spacer()
                dot()
            }
        }
    }
    
    @ViewBuilder func dot() -> some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: dotWidth, height: dotWidth)
            .foregroundColor(.black)
    }
}
