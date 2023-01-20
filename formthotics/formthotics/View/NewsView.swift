//
//  NewsView.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        
        VStack {
            Image ("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 60)
            .padding(.bottom, 150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image ("222"))
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
