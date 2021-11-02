import Foundation

class Node{
    let key : Int
    var left : Node?
    var right : Node?
    
    init(key: Int){
        self.key = key
    }
}
class Tree{
    var root : Node?
    
    func append(key: Int, nodeinfo : [[Int]])
    {
        
        if self.root == nil {
            self.root = Node(key: key)
            return
        }
        var cur_Node = self.root
        
        while true{
            if nodeinfo[cur_Node!.key][0] > nodeinfo[key][0]
            {
                guard let left_node = cur_Node!.left else{
                    return cur_Node!.left = Node (key: key)
                }
                if nodeinfo[left_node.key][1] < nodeinfo[key][1]
                {
                    cur_Node?.left = Node(key: key)
                    if(nodeinfo[cur_Node!.left!.key][0] > nodeinfo[left_node.key][0])
                    {
                        cur_Node?.left?.left = left_node
                    }else{
                        cur_Node?.left?.right = left_node
                    }
                }else{
                    cur_Node = left_node
                }
            }else{
                guard let right_node = cur_Node!.right else{
                    return cur_Node!.right = Node (key: key)
                }
                if nodeinfo[right_node.key][1] < nodeinfo[key][1]
                {
                    cur_Node?.right = Node(key: key)
                    if(nodeinfo[cur_Node!.right!.key][0] > nodeinfo[right_node.key][0])
                    {
                        cur_Node!.left!.left = right_node
                    }else{
                        cur_Node!.left!.right = right_node
                    }
                }else{
                    cur_Node = right_node
                }
            }
        }
    }
    func preorder(node: Node?,result :inout [Int]){
        
        guard let cur_Node = node else { return }
        result.append(cur_Node.key+1)
        preorder(node: cur_Node.left, result: &result)
        preorder(node: cur_Node.right, result: &result)
    }
    func postorder(node: Node?,result : inout [Int]){
        guard let cur_Node = node else { return }
        postorder(node: cur_Node.left, result: &result)
        postorder(node: cur_Node.right, result: &result)
        result.append(cur_Node.key+1)
    }
}
func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    let sortedNode = nodeinfo.enumerated().sorted{ (a1 ,a2) in
        a1.element[1] > a2.element[1]
    }
    var tree = Tree()
    for i in 0 ..< sortedNode.count{
        tree.append(key: sortedNode[i].offset, nodeinfo: nodeinfo)
        
    }
    var answer = [[Int]](repeating: [Int](), count: 2)
    tree.preorder(node: tree.root!, result: &answer[0])
    tree.postorder(node: tree.root!, result: &answer[1])
    print(answer)
    return answer
}

solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]])
