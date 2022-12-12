//
//  Dice.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI

struct Die: View {
    let dieColor: [Color] = [Color(UIColor(red: 0.97, green: 0.96, blue: 0.93, alpha: 1.00)), Color(UIColor(red: 0.84, green: 0.81, blue: 0.69, alpha: 1.00)), Color(UIColor(red: 0.42, green: 0.38, blue: 0.27, alpha: 1.00))]
    
    var body: some View {
        Text("6")
            .font(.system(size: 1000))
            .minimumScaleFactor(0.005)
            .frame(width: 400, height: 400)
            .foregroundColor(.black)
            .font(.title).bold()
            .background(
                LinearGradient(colors: dieColor, startPoint: .topLeading, endPoint: .bottomTrailing)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)))
                            .padding(30)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 13)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                            .shadow(color: Color(UIColor(red: 0.93, green: 0.90, blue: 0.81, alpha: 1.00)), radius: 0)
                    )
            )
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 7)
            )
    }
}

struct Die_Previews: PreviewProvider {
    static var previews: some View {
        Die()
    }
}
