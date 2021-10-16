import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var dictionary = [String:[String]]()
    var arr = [String]()
    var result = [String]()
    
    for ticket in tickets
    {
        if let value = dictionary[ticket[0]]
        {
            arr = value
            arr.append(ticket[1])
            dictionary.updateValue(arr, forKey: ticket[0])
        }else{
            dictionary.updateValue([ticket[1]], forKey: ticket[0])
        }
    }
    
    for ticket in tickets {
        if let value = dictionary[ticket[0]]{
            arr = value
            arr.sort()
            dictionary.updateValue(arr, forKey: ticket[0])
        }
    }
    
    func dfs(_ start:String,_ res:inout [String],_ n:Int,_ dic:[String:[String]]) {
        var dic = dic
        if n == tickets.count
        {
            result = res
            return
        }
        guard let ticket = dic[start] else {return }
        
        for point in ticket where result.isEmpty
        {
            res.append(point)
            var tic = ticket
            tic.remove(at: tic.firstIndex(of: point)!)
            dic.updateValue(tic, forKey: start)
            dfs(point,&res,n+1,dic)
            res.removeLast()
        }
    }
    var res = [String]()
    res.append("ICN")
    dfs("ICN", &res ,0,dictionary)
    return result
}


solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
