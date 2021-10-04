import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var widthMax = 0
    var heightMax = 0
    for size in sizes{
        var arr = size.sorted(by: >)
        if widthMax < arr[0]
        {
            widthMax = arr[0]
        }
        if heightMax < arr[1]
        {
            heightMax = arr[1]
        }
    }
    
    return widthMax * heightMax
}

solution([[60, 50], [30, 70], [60, 30], [80, 40]])
