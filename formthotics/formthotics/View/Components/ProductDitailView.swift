//
//  ProductDitailView.swift
//  formthotics
//
//  Created by Vasiliy on 12.01.2023.
//

import SwiftUI

struct ProductDitailView: View {
    
    var viewModel: ProductDitailViewModel
    @State var size = "M"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("\(viewModel.product.title)")
                .font(.custom("AvenirNext-bould", size: 20))
            
            HStack {
                
                Image("\(viewModel.product.imageUrl)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width * 0.4, height: screen.width * 0.3)
                    .shadow(radius: 12)
                    .padding()
                
                VStack (alignment: .leading){
                    Text("Жесткость: \(viewModel.product.rigidity)")
                    Text("Вес до: \(viewModel.product.weight) кг")
                }
                
                Spacer()
            }
            
            VStack (alignment: .leading){
                
                HStack {
                    Text("Размеры:")
                    Spacer()
                    Text("Цена: \(viewModel.product.price) руб")
                    
                }
                
                Picker("StringProtocol", selection: $size) {
                    
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                    
                }.pickerStyle(.segmented)
                
                HStack {
                    
                    Stepper("", value: $count, in: 1...30)
                    
                    Text("\(count)")
                        .padding(.horizontal,25)
                    
                    Spacer()
                    
                    Button {
                        let position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
                        
                        CartViewModel.shared.addPosition(position)
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("В корзину")
                            .padding(8)
                            .frame(maxWidth: 155)
                            .foregroundColor(.white)
                            .background(LinearGradient(colors: [Color("ColorLightBlue"), Color("ColorBlue")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                    }
                }
                
                Text("Описание:")
                    .font(.custom("AvenirNext-bould", size: 20))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("\(viewModel.product.discript)")
                }
            }
            
        }
        .padding()
        
        
    }
}

struct ProductDitailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDitailView(viewModel: ProductDitailViewModel(product: Product(id: "1",
                                                                             title: "КРАСНО-ГОЛУБЫЕ",
                                                                             imageUrl: "12",
                                                                             price: 3500,
                                                                             discript: "Двухслойные ортезы, состоящие из мягкого покровного материала и более плотного формообразующего основания. Отличаются высокими амортизационными качествами, обеспечивают стопам надежную опору, эффективно управляют движением. Подходят для пациентов с различными патологиями опорно-двигательного аппарата, связанными с перегрузками, а также спортсменам различных видов спорта. Особенности строения заднего отдела ортеза подходят пациентам при пяточной шпоре. Возможно использование при ригидной стопе.",
                                                                             layers: 2,
                                                                             rigidity: 6,
                                                                             age: "Взрослый",
                                                                             weight: 70)))
    }
}
