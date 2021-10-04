import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Solution {
    public int solution(int sticker[]) {
        int answer = 0;
        int i;
        int[] dp = new int[sticker.length];
        int[] dp2 = new int[sticker.length];
        int[] sticker2 = sticker.clone();

        if (sticker.length == 1) {
            return sticker[0];
        }

        dp[0] = sticker[0];
        sticker[sticker.length - 1] = 0;
        for (i = 1; i < sticker.length; i++) {
            if (i == 1) {
                dp[i] = sticker[i];
                dp2[i] = sticker2[i];
            } else if (i == 2) {
                dp[i] = sticker[i] + dp[0];
                dp2[i] = sticker2[i]+dp2[0];
            } else {
                dp[i] = sticker[i]+Math.max(dp[i - 2], dp[i - 3]);
                dp2[i] = sticker2[i]+Math.max(dp2[i - 2], dp2[i - 3]);
            }
        }
        int max= Math.max(dp[sticker.length-1],dp[sticker.length-2]);
        max = Math.max(max, Math.max(dp2[sticker2.length - 1], dp2[sticker2.length - 2]));

        System.out.println(max);
        return answer;
    }

    public static void main(String[] args) {
        new Solution().solution(new int[]{14, 6, 5, 11, 3, 9, 2, 10});
    }
}