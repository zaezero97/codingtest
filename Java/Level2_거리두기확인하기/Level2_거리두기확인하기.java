import java.util.*;
class Leel2_거리두기확인하기 {
    public int[] solution(String[][] places) {
        ArrayList<ArrayList> points_list = new ArrayList<>();
        ArrayList<Point> points = new ArrayList<>();
        int[] result = {1,1,1,1,1};
        int i,j,z;
        int index;
        int m_Distance;
        for (i = 0; i < places.length; i++){ // 5개의 맵을 돌면서 p의 좌표를 저장
            points.clear();
            for (j = 0; j < 5; j++) {
                index = places[i][j].indexOf('P');
                while(index !=-1){
                    points.add(new Point(index,j));
                    index = places[i][j].indexOf('P',1+index);
                }
            }
            points_list.add((ArrayList) points.clone());
        }

        for (i = 0; i < points_list.size(); i++) {
            ArrayList<Point> p_list = points_list.get(i);
            for(j=0;j<p_list.size()-1;j++)
            {
                for (z = j+1; z < p_list.size(); z++) {
                    Point point1 = p_list.get(j);
                    Point point2 = p_list.get(z);

                    m_Distance = Math.abs(point1.x- point2.x) + Math.abs(point1.y- point2.y);
                    if (m_Distance == 1) {
                        result[i] = 0;
                    } else if(m_Distance == 2){
                        if (Math.abs(point1.x - point2.x) == 2) {
                            if(places[i][point1.y].charAt((point1.x+ point2.x)/2) == 'O')
                                result[i] = 0;
                        } else if (Math.abs(point1.y - point2.y) == 2) {
                            if (places[i][(point1.y + point2.y) / 2].charAt(point1.x) == 'O') {
                                result[i] = 0;
                            }
                        } else {
                            if (point1.y < point2.y) {
                                if(places[i][point1.y + 1].charAt(point1.x) == 'O')
                                    result[i] = 0;
                                else if(places[i][point2.y - 1].charAt(point2.x) == 'O')
                                    result[i] = 0;
                            }
                            else if (point1.y > point2.y) {
                                if(places[i][point1.y - 1].charAt(point1.x) == 'O')
                                    result[i] = 0;
                                else if(places[i][point2.y + 1].charAt(point2.x) == 'O')
                                    result[i] = 0;
                            }
                        }
                    }

                }
            }
        }
        return result;
    }
    static class Point{
        int x,y;

        Point(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }
}