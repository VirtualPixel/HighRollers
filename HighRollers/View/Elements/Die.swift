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
    let dieColor: [Color] = [Color(UIColor(red: 0.97, green: 0.96, blue: 0.93, alpha: 1.00)), Color(UIColor(red: 0.84, green: 0.81, blue: 0.69, alpha: 1.00)), Color(UIColor(red: 0.42, green: 0.38, blue: 0.27, alpha: 1.00))]
    
    var body: some View {
        GeometryReader { geo in
            LinearGradient(colors: dieColor, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: geo.size.width, height: geo.size.width)
                .overlay(
                    Group {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)))
                            .padding(30)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 13)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                            .frame(width: geo.size.width, height: geo.size.width)
                        
                        RoundedRectangle(cornerRadius: 9).stroke(Color.black, lineWidth: 7)
                            .frame(width: geo.size.width, height: geo.size.width)
                        
                        DieResult(number: result, isNumeric: isNumeric, dotWidth: geo.size.width * 0.2)
                    }
                )
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
            switch isNumeric {
            case true:
                Text("\(number)")
                    .foregroundColor(.black)
            case false:
                switch number {
                case 1:
                    dot()
                case 2:
                    two()
                case 3:
                    three()
                case 4:
                    four()
                case 5:
                    five()
                case 6:
                    six()
                default:
                    Text("\(number)")
                        .foregroundColor(.black)
                }
            }
        }
        .font(.system(size: 1000))
        .minimumScaleFactor(0.005)
        .font(.title).bold()
        .padding(dotWidth * 0.7)
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