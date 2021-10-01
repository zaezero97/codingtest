import java.util.ArrayList;
import java.util.List;

class Solution {
    public long solution(int n) {
        long answer = 0;
        List<Long> dp = new ArrayList<>();
        dp.add((long)0);
        dp.add((long)1);
        dp.add((long)2);

        if(n<3)
        {
            return dp.get(n);
        }

        int i;

        for(i=3;i<=n;i++)
        {
            dp.add(dp.get(i - 1) + dp.get(i - 2));
        }
        answer = dp.get(n)%1234567;
        return answer;
    }


    public static void main(String[] args) {
        new Solution().solution(5);
    }
}