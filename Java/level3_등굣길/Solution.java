import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Solution {
    int[] dx ={1,0};
    int[] dy ={0,1};
    public int solution(int m, int n, int[][] puddles) {
        int answer = 0;
        int temp;
        int i,j;
         temp = m;
         m =n;
         n= temp;

        int[][] dp = new int[m][n];

        if(m==1||n==1){
            if(puddles.length!=0)
                return 0;
            return 1;
        }

        dp[0][0] = 1;

        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                if(is_Pool(i,j,puddles)|| i+j==0)
                    continue;
                if (i == 0 && j!=0) {
                    dp[i][j] = dp[i][j-1];
                } else if (j == 0 && i != 0) {
                    dp[i][j] = dp[i-1][j];
                } else {
                    dp[i][j] =  dp[i][j-1] + dp[i - 1][j];
                }
            }
        }

        for (int[] a : dp) {
            for (int b : a) {
                System.out.print(b+",");
            }
            System.out.println(" ");
        }
        return answer;
    }
    boolean is_Pool(int y,int x,int[][] puddles) {
        int i,j;

        for (i = 0; i < puddles.length; i++) {
            if (puddles[i][0]-1 == x && puddles[i][1]-1 == y) {
                   return true;
            }
        }
        return false;
    }
    public static void main(String[] args) {
        new Solution().solution(7,4,new int[][]{{2, 1}, {2, 2}, {2, 3}, {4, 2}, {4, 3}, {4, 4}, {6, 2}, {6, 3}});
    }
}