import Foundation

struct FightInfo{
    var win_rate : Double
    var heavy_win : Int
    var index : Int
    
}
func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    
    var fightInfos : [FightInfo] = []
    var fightInfo : FightInfo
    var rate : Double
    var h_win : Int
    var round : Int!
    for (i,head) in head2head.enumerated(){
        rate = 0
        h_win = 0
        round = 0
        let arr = head.map{String($0)}
        for (index,e) in arr.enumerated(){
            if e != "N"
            {
                round += 1
            }
            if e == "W"{
                rate += 1.0
                if weights[i] < weights[index]
                {
                    h_win += 1
                }
            }
        }
        if round != 0
        {
            fightInfo = FightInfo(win_rate: (rate/Double(round)) * 100,heavy_win: h_win,index: i)
        }
        else
        {
            fightInfo = FightInfo(win_rate: 0,heavy_win:0,index: i)
        }
        fightInfos.append(fightInfo)
    }
    
    fightInfos.sort{
        if $0.win_rate > $1.win_rate
        {
            return true
        }
        else if $0.win_rate == $1.win_rate
        {
            if $0.heavy_win > $1.heavy_win
            {
                return true
            }
            else if $0.heavy_win == $1.heavy_win , weights[$0.index] > weights[$1.index]
            {
                return true
            }
        }
       return false
       
    }
    print(fightInfos)
    return fightInfos.map{$0.index+1}
}
solution( [50, 82, 75, 120], ["NLWL", "WNLL", "LWNW", "WWLN"])
