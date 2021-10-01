import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Solution {
    public int solution(int[][] triangle) {
        int answer = 0;
        int level;
        int[][] dp = new int[triangle.length][triangle[triangle.length - 1].length];
        int i,j;

        if (triangle.length == 1) {
            return triangle[0][0];
        }
        dp[0][0] = triangle[0][0];

        for (i = 1; i < triangle.length; i++) {
            for (j = 0; j < triangle[i].length; j++) {
                if (j == 0) {
                    dp[i][j] = dp[i-1][0] + triangle[i][j];
                } else if (j == triangle[i].length - 1) {
                    dp[i][j] = dp[i - 1][j-1] + triangle[i][j];
                } else {
                    dp[i][j] = Math.max(dp[i-1][j],dp[i-1][(j-1)])+triangle[i][j];
                }
            }
        }
        int max = 0;
        for (i = 0; i <triangle[triangle.length-1].length; i++) {
            max = Math.max(max, dp[triangle.length - 1][i]);
        }
        return answer;
    }

    public static void main(String[] args) {
        new Solution().solution(new int[][]{{7}, {3, 8}, {8, 1, 0}, {2, 7, 4, 4}, {4, 5, 2, 6, 5}});
    }
}