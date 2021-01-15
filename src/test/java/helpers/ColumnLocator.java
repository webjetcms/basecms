package helpers;

@SuppressWarnings("unused")
public class ColumnLocator {

    private String name;

    private int order;

    public int getOrder() {
        return order;
    }


    public void setOrder(int order) {
        this.order = order;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ColumnLocator(String name){
        setName(name);
        setOrder(0);
    }
}
