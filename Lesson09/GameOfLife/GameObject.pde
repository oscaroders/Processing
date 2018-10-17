public class GameObject{

    float x, y, size;
    int numberOfNeighbours;
    boolean beenActive, alive;
    int aliveCount, deadCount, fader = 255;

    public GameObject(float x, float y, float size){
        this.x = x;
        this.y = y;
        this.size = size;
    }


    void update(){
        alive = ruleCheck();
    }


    void draw(){
        if(alive){
            beenActive = true;
            setColors(alive);
            rect(x, y, size, size);
            setCount(alive);
        }

        if(!alive){
            setColors(alive);
            rect(x, y, size, size);
            setCount(alive);
        }
    }


    void addNegihbourCount(int a){
        numberOfNeighbours = a;
    }


    boolean ruleCheck(){
        if(alive){
            if(numberOfNeighbours < 2 || numberOfNeighbours > 3)
                return false;
            return true;
        }
        if(numberOfNeighbours == 3)
            return true;
        return false;
    }


    void setColors(boolean alive){
        if(alive){
            if(aliveCount < 2){
                fill(0, 255, 28);
            } else {
                fill(aliveCount, y / 255, 28 + aliveCount);
            }
        }

        if(!alive){
            if(deadCount < 1){
                fill(139, 0, 0);
            } else if(beenActive) {
                fill(220, 0 + (deadCount * 25 * 2), 0 + (deadCount * 25 * 2));
            } else {
                fill(255, 255, 255);
            }
        }
    }


    void setCount(boolean alive){
        if(alive){
            aliveCount += 30;
            deadCount = 0;
            if(aliveCount > 255){
                aliveCount = 255;
            }
        }

        if(!alive){
            deadCount++;
            aliveCount = 0;
            if(deadCount > 5){
                deadCount = 5;
            }
        }
    }
}
