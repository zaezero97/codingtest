import Foundation

func solution(_ phone_number:String) -> String {
    var result = ""
    phone_number.enumerated().forEach{
        (index,element) in
        if index < phone_number.count - 4
        {
            result += "*"
        }else{
            result += String(element)
        }
    }
    return result
}

solution("01033334444")
