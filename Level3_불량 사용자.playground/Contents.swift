import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var numberofCase = Set<[String]>()
    var result = [String]()
    var visited = [Bool](repeating: false, count: user_id.count)
    
    func dfs(result: inout[String],i:Int,n: Int,r:Int, checkId: (String,String)->Bool){
        if i == r{
            
            numberofCase.insert(result.sorted())
            return
        }
        
        for index in 0 ..< n{
            if visited[index]{
                continue
            }
            if banned_id[i].count != user_id[index].count {
                continue
            }
            if checkId(user_id[index],banned_id[i]){
                print(result)
                visited[index] = true
                result.append(user_id[index])
                dfs(result: &result,i: i + 1 ,n: n, r: r,checkId:checkId)
                visited[index] = false
                result.removeLast()
            }
        }
    }
    dfs(result: &result,i: 0 , n: user_id.count, r: banned_id.count,checkId: checkId)
    return numberofCase.count
}
func checkId(str : String, banId : String) -> Bool{
    
    let str = Array(str)
    let banId = Array(banId)
    
    for i in 0 ..< banId.count{
        if banId[i] == "*"{continue}
        if banId[i] != str[i] { return false}
    }
    return true
}

solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])
