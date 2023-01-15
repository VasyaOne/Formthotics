//
//  Catalog.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct CatalogView: View {
    
//    let laout = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    
    var body: some View {
        
        VStack {
            Image ("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screen.width * 0.30, height: screen.width * 0.20, alignment: .center)
            
            VStack (alignment: .leading){
                ScrollView(.vertical, showsIndicators: false) {

                    Section("ОДНОСЛОЙНЫЕ ОРТЕЗЫ") {
                        
                                ForEach(CatalogViewModel.shared.oneLayerProducts, id: \.id) { item in
                                    NavigationLink {
                                        
                                        let viewModel = ProductDitailViewModel(product: item)
                                        
                                        ProductDitailView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                            .foregroundColor(.black)
                                    }
                                }
                    }
                    Section("ДВУХСЛОЙНЫЕ ОРТЕЗЫ") {
                        
                                ForEach(CatalogViewModel.shared.twoLayerProducts, id: \.id) { item in
                                    NavigationLink {
                                        let viewModel = ProductDitailViewModel(product: item)
                                        
                                        ProductDitailView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                            .foregroundColor(.black)
                                    }
                                }
                    }
                    Section("ОРТЕЗЫ ДЛЯ ДЕТЕЙ") {
                        
                                ForEach(CatalogViewModel.shared.kidsProduct, id: \.id) { item in
                                    NavigationLink {
                                        let viewModel = ProductDitailViewModel(product: item)
                                        
                                        ProductDitailView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                            .foregroundColor(.black)
                                    }
                                }
                    }
                    
                    Section("КОРРЕКЦИЯ ОРТЕЗОВ") {
                        
                                ForEach(CatalogViewModel.shared.correctProduct, id: \.id) { item in
                                    NavigationLink {
                                        let viewModel = ProductDitailViewModel(product: item)
                                        
                                        ProductDitailView(viewModel: viewModel)
                                    } label: {
                                        ProductCell(product: item)
                                            .foregroundColor(.black)
                                    }
                                }
                    }
                }.navigationBarBackButtonHidden(true)
                    Text("")
            }
        }
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
