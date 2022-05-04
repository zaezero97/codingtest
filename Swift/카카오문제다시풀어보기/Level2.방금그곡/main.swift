//
//  main.swift
//  카카오문제다시풀어보기
//
//  Created by 재영신 on 2022/05/04.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {

    var result = [(time: Int, name: String)]()
    
    let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    
    for i in 0 ..< musicinfos.count {
        let s = musicinfos[i].split(separator: ",")
        let endTime = s[1].split(separator: ":").map { Int(String($0))! }
        let startTime = s[0].split(separator: ":").map { Int(String($0))! }
        
        let hour = endTime[0] - startTime[0]
        let min = (60*hour) + endTime[1] - startTime[1]
        var music = s[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map { String($0) }
        
        if min > music.count {
            for j in 0 ..< min {
                let index = j % music.count
                music.append(music[index])
            }
        } else if min < music.count {
            music = [String](music[0..<min])
        }
        
        if music.joined().contains(m) {
            result.append((min, String(s[2])))
        }
    }
    if result.isEmpty {
        return "(None)"
    } else {
        return result.sorted(by: { $0.time > $1.time}).first!.name
    }
}

print(solution("CC#BCC#BCC#BCC#B", ["04:00,04:08,BAR,CC#BCC#BCC#B"]))
