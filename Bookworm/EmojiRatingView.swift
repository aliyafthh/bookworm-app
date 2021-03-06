//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Aliya Fatihah Mohamed Sidek on 26/03/2022.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16

    var body: some View {
        switch rating {
        case 1:
            Text("ðĨē")
        case 2:
            Text("ð")
        case 3:
            Text("ð")
        case 4:
            Text("ðĪŠ")
        default:
            Text("ð")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
