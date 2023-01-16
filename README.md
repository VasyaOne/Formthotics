# Formthotics
### О приложении:
Приложение интернет магазин для врачей занимающиемися установкой стелек и прошедших трехдневный семинар

## Скрины:
<img src="https://github.com/VasyaOne/Formthotics/blob/main/Screen/Simulator%20Screen%2001.png" style="width: 150px"> <img src="https://github.com/VasyaOne/Formthotics/blob/main/Screen/Simulator%20Screen%2002.png" style="width: 150px"> <img src="https://github.com/VasyaOne/Formthotics/blob/main/Screen/Simulator%20Screen%2003.png" style="width: 150px"> <img src="https://github.com/VasyaOne/Formthotics/blob/main/Screen/Simulator%20Screen%2004.png" style="width: 150px"> 

## Как это работает:
Врач регистрируется или ему предоставляют созданный аккаунт после прохождения семинара

## Технологии:
Приложение написано на языке ***Swift***.
Так же использованы технологии реактивного программирования: 
- SwiftUI
- MVVM
- Singleton pattern
- Firebase
- Core Location

## части кода:
``` swift
 class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() { }
    
   @Published var position = [Position]()
    
    var cost: Int {
        var sum = 0
        for pos in position {
            sum += pos.cost
        }
        
        return sum
    }
```

## Команда разработчиков: 
- Разработчик - Василий Леонов
    
