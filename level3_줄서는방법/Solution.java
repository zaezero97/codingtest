import java.util.*;
class Solution{
    public int[] solution(int n, long k) {
        int[] answer = new int[n];//if n =4 k =7  1 2 3 4 이면 앞에 자리는 뒷에 모든경우의수를 지나면 바뀐다 따라서 (n-1)!
        int i;
        int factorial=1;
        int index=0;
        List<Integer> list = new ArrayList<>();
        for (i = 1; i <= n; i++) {
            factorial *= i; // n! 구하기
            list.add(i);
        }
        // 2134 2143
        k--; // 인덱스는 0부터 시작하기때문에
        while (n > 0) {
            factorial /= n; // (n-1)
            answer[index++] = list.remove((int)k/factorial); //if n=4 k=7 이면 k==6  k/(n-1)!  6/6 ==1 -> answer[0] = 2
            k %= factorial;
            n--;
        }

        return answer;
    }

    public static void main(String[] args) {
        new Solution().solution(3, 5);
    }
}
