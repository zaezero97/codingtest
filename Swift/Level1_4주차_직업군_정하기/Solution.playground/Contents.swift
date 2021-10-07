import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    
    var tuple = (val : 0 , sub :"")
    var n : Int!

    var max : Int!
    for i in 0 ..< table.count
    {
        
        let occupation = table[i].split(separator: " ").reversed().map{String($0)}
        //print(occupation)
        max = 0
        for (index, element) in languages.enumerated()
        {
            
            n = 0
            for j in 0 ..< occupation.count-1{
                    n += 1
                if(element == occupation[j])
                {
                
                    max += (n * preference[index])
                    break
                }
            }
        }
      
        if max > tuple.val
        {
            tuple.sub = occupation[occupation.endIndex-1]
            tuple.val = max
            
        }else if max == tuple.val , occupation[occupation.endIndex-1] < tuple.sub
        {
            tuple.sub = occupation[occupation.endIndex-1]
            tuple.val = max
        }
    }
    print(tuple.sub)
    return tuple.sub
}

solution(["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"], ["JAVA", "JAVASCRIPT"], [7, 5])
