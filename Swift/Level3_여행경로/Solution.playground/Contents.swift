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
    } //tickets 배열을 dictionary로 저장
    //dictionary로 저장한 이유는 알파벳 순서로 정렬 및 dfs때 쉽게 값에 접근하기 위해서였는데
    //다른 분들 풀이를 보니 그냥 2차원배열에서 도착지 기준으로 정렬 했으면 됐다.
    
    
    for ticket in tickets {
        if let value = dictionary[ticket[0]]{
            arr = value
            arr.sort()
            dictionary.updateValue(arr, forKey: ticket[0])
        }
    }// 정렬 부분
    
    func dfs(_ start:String,_ res:inout [String],_ n:Int,_ dic:[String:[String]]) {
        var dic = dic
        if n == tickets.count
        {
            result = res
            return
        }
        guard let ticket = dic[start] else {return }
        
        for point in ticket where result.isEmpty //만약 이미 결과가 나왔으면 dfs를 수행하지 않는다.
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
