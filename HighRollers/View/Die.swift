//
//  Dice.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI

struct Die: View {
    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.red)
                .frame(maxWidth: geo.size.width, maxHeight: .infinity)
        }
    }
}

struct Die_Previews: PreviewProvider {
    static var previews: some View {
        Die()
    }
}
