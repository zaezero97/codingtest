import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Solution {
    public int solution(int[] money) {
        int answer = 0;
        int[] dp1 = new int[money.length],dp2 = new int[money.length]; //dp배열두개 선언한 이유: 양옆을 선택하지 못하기 때문에 첫번째를 선택하고 시작한 결과 와 마지막을 선택하고 시작한 결과를 따진다.
        int[] money2 = money.clone();
        int i;
        int max;
        dp1[0] = money[0];
        money[money.length-1] = 0;
        money2[0] = 0;

        for (i = 1; i < money.length; i++) {
            if (i == 1) {
                dp1[i] = money[i];
                dp2[i] = money2[i];
            } else if (i == 2) {
                dp1[i] = dp1[i-2]+money[i] ;
                dp2[i] = dp2[i-2]+money[i];
            } else {
                dp1[i] = Math.max(dp1[i-2],dp1[i-3]) + money[i];
                dp2[i] = Math.max(dp2[i - 2], dp2[i - 3]) + money2[i];
            }
        }
        max = Math.max(dp1[money.length - 1], dp1[money.length - 2]);
        max = Math.max(max, Math.max(dp2[money2.length - 1], dp2[money2.length - 2]));

        System.out.println(max);
        return answer;
    }
    public static void main(String[] args) {
        new Solution().solution(new int[]{1,2,3,1});
    }
}