import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

class Solution {
    int min;
    public int solution(String begin, String target, String[] words) {
        int answer = 0;
        min = 9999;
        boolean[] visited = new boolean[words.length];

        if (Arrays.stream(words).collect(Collectors.toList()).indexOf(target) ==-1) {
            return 0;
        }
        dfs(begin,target,words,visited,0);
        System.out.println(min);
        return answer;
    }

    void dfs(String begin, String target, String[] words, boolean[] visited,int n) {
        if (begin.equals(target)) {
            if (min > n) {
                min = n;
            }
            return;
        }
        for (int i = 0; i < words.length; i++) {
            if (!visited[i] && is_DiffOneChar(begin,words[i])) {
                visited[i] = true;
                begin = words[i];
                dfs(begin,target,words,visited,n+1);
            }
        }
    }

    boolean is_DiffOneChar(String s1, String s2) {
        int N = 0;
        for (int i = 0; i < s1.length(); i++) {
            if(s1.charAt(i) != s2.charAt(i))
                N++;
            if(N>1)
                return false;
        }
        return true;
    }
    public static void main(String[] args) {
        new Solution().solution("hit","cog",new String[]{"hot", "dot", "dog", "lot", "log", "cog"});
    }
}