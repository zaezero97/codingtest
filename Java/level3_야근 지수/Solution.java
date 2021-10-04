import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

class Solution {
    public long solution(int n, int[] works) {
        long answer = 0;
        int i;
        if (n >= Arrays.stream(works).reduce(0, (n1, n2) -> n1 + n2)) {
            return 0;
        } // if 퇴근까지 남은시간보다 남은 작업량이 적거나 같으면 0
        List<Integer> list =Arrays.stream(works).boxed().collect(Collectors.toList());
        Collections.sort(list,Collections.reverseOrder()); // 작업량이 큰순으로 정렬
        int long_work = list.get(0); // long_work -> 가장 작업량이 많은 남은 일
        i=0;
        while (n > 0) {
            if (long_work == list.get(i)) { // 가장작업량이 많은 순으로 처리
                list.set(i, list.get(i) - 1);
                i++;
                n--;
            } else {
                i =0;
                long_work = list.get(0);
            }
        }
        for (i = 0; i < list.size(); i++) {
            answer += Math.pow(list.get(i),2);
        }

        return answer;
    }

    public static void main(String[] args) {
        new Solution().solution(4, new int[]{4,3,3});
    }
}