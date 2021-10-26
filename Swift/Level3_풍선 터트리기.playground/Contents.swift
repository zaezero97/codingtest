import Foundation

func solution(_ a:[Int]) -> Int {
    var left = 0
    var right = a.count - 1
    var left_min = a[left]
    var right_min = a[right]
    var answer = 2
    while abs(left-right) != 1{
        if a[left]>a[right]
        {
            left += 1
            if a[left] < left_min
            {
                answer += 1
                left_min = a[left]
            }
        }else
        {
            right -= 1
            if a[right] < right_min
            {
                answer += 1
                right_min = a[right]
            }
        }
    }
    
    return answer
}
// 풍선 터트리기 붙어 있는 두개를 터트려서 마지막 남을 수 있는 퐁선의 개수를 세는 문제
// 인접한 두 풍선중에 큰 숫자인 풍선을 터트리지만 작은 숫자인 풍선을 한번 터트릴 수 있음
// 내가 생각한 거는 일단 끝에 있으면 무조건 마지막까지 남을 수 있다. 왜냐 한쪽 숫자가 큰 값이 오든 작은 값이 오든 작은 숫자를 터트릴 수 있는 기회가 있으니 무조건 남을 수 있다. -> answer = 2
// 중간에 위치한 풍선은 왼쪽 오른쪽을 나눠 두 부분의 최소값 보다 동시에 크지만 않으면 된다.
// 따라서 풍선을 기준으로 왼쪽 부분 오른쪽 부분의 최솟값중 더 큰값보다 작기만 하면 된다.
// 먼저 좌측부분의 최솟값을 인덱스 0의 값으로 설정하고 우측부분 최솟값을 인덱스 배열의 길이 값으로 설정한다
// 둘중 더 큰 값의 인덱스 앞에 값이랑 비교해서 만약 더 작으면 그 풍선은 마지막까지 남을수 있는 풍선으로 판단하고 최솟값을 갱신한다
// 이렇게해서 왼쪽 오른쪽을 비교하면서 진행하면 결과를 얻을 수 있다.
solution([-16,27,65,-2,58,-92,-71,-68,-61,-33])
