//
//  main.swift
//  1343.폴리오미노
//
//  Created by 재영신 on 2022/06/06.
//

import Foundation

func main() {
    
    var poly = readLine()!

    poly = poly.replacingOccurrences(of: "XXXX", with: "AAAA")
    poly = poly.replacingOccurrences(of: "XX", with: "BB")

    print(poly.contains("X") ? "-1" : poly)
}

main()

