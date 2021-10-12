import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var x = 0
    var y = 0
    var interPs = [Int:[Int]]()
    var Point = [Int]()
  var min = Int.max
    var max = -1 * Int.max
    var miny = Int.max
    var maxy = -1 * Int.max
    var parent = 0
    for i in 0 ..< line.count-1 {
        for j in i+1 ..< line.count
        {
            if((line[i][0]*line[j][1]) - (line[i][1]*line[j][0]) == 0)
            {
                continue
            }
             parent = (line[i][0]*line[j][1]) - (line[i][1]*line[j][0])
            x = (line[i][1]*line[j][2] - line[j][1]*line[i][2])
            y = (line[i][2]*line[j][0] - line[i][0]*line[j][2])
            
            if x % parent != 0 || y % parent != 0
            {
                continue
            }
            x /= parent
            y /= parent
                if let interP = interPs[y]
                {
                    Point = interP
                    Point.append(x)
                    //interPs[Int(y)] = interP
                    interPs.updateValue(Point, forKey: y)
                }else{
                    interPs[y] = [x]
                }
                
                if min > x
                {
                    min = x
                }
                if max < x
                {
                    max = x
                }
                if maxy < y
                {
                    maxy = y
                }
                if miny > y
                {
                    miny = y
                }
            
                
        }
    }
    var result = [[String]](repeating: [String](repeating: ".", count: max-min+1), count: maxy - miny + 1)
    var row = 0
    var col = 0
    for i in interPs.keys
       {
           if let interP = interPs[i]
           {
               for point in interP
               {
                   col = point - min
                   row = i - maxy
               
                   result[abs(row)][col] = "*"
               }
           }
       }
   
    var answer =  result.map{
        $0.joined()
    }
   
    return answer
}

solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
