package finalProj;

import java.util.Date;

public class Expenditure {
    private int id;
    private int user_id;
    private String description;
    private String date;
    private int genre_id;
    private double amount;

    public Expenditure(int id, int user_id, String description, String date, int genre_id, double amount) {
        this.id = id;
        this.user_id = user_id;
        this.description = description;
        this.date = date;
        this.genre_id = genre_id;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getDescription() {
        return description;
    }

    public String getDate() {
        return date;
    }

    public int getGenre_id() {
        return genre_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setGenre_id(int genre_id) {
        this.genre_id = genre_id;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
