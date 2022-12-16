//
//  Dice.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI

struct Die: View {
    var result = 0
    var isNumeric = false
    let dieColor: [Color] = [Color(UIColor(red: 0.97, green: 0.96, blue: 0.93, alpha: 1.00)), Color(UIColor(red: 0.84, green: 0.81, blue: 0.69, alpha: 1.00)), Color(UIColor(red: 0.42, green: 0.38, blue: 0.27, alpha: 1.00))]
    
    
    var body: some View {
        LinearGradient(colors: dieColor, startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 400, height: 400)
            .overlay(
                Group {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)))
                        .padding(30)
                        .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 13)
                        .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                        .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                        .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                    
                    RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 7)
                    
                    DieResult(number: result, isNumeric: isNumeric)
                }
            )
            
    }
}

struct Die_Previews: PreviewProvider {
    static var previews: some View {
        Die(result: 1, isNumeric: true)
    }
}

struct DieResult: View {
    let number: Int
    let isNumeric: Bool
    
    init(number: Int, isNumeric: Bool) {
        if number > 6 || number < 1 {
            self.number = number
            self.isNumeric = true
        } else {
            self.number = number
            self.isNumeric = isNumeric
        }
    }
    
    var body: some View {
        Group {
            switch isNumeric {
            case true:
                Text("\(number)")
            case false:
                switch number {
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
                    one()
                }
            }
            
        }
        .font(.system(size: 1000))
        .minimumScaleFactor(0.005)
        .padding(20)
        .font(.title).bold()
    }
    
    @ViewBuilder func one() -> some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 60, height: 60)
    }
    
    @ViewBuilder func two() -> some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Spacer()
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                Spacer()
            }
        }
        .padding(40)
    }
    
    @ViewBuilder func three() -> some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            
            Spacer()
            
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
            
            Spacer()
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                Spacer()
            }
        }
        .padding(40)
    }
    
    @ViewBuilder func four() -> some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .padding(40)
    }
    
    @ViewBuilder func five() -> some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            
            Spacer()
            
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
            
            Spacer()
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .padding(40)
    }
    
    @ViewBuilder func six() -> some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Spacer()
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .padding(40)
    }
}
