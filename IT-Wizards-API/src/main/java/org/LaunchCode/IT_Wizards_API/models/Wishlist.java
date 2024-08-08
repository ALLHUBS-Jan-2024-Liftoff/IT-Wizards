package org.LaunchCode.IT_Wizards_API.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Wishlist extends AbstractEntity{

    //Fields
    @ManyToOne
    @JoinColumn(name="user_id")
    @JsonIgnore
    private User user;

    @ManyToOne
    @JoinColumn(name="item_id")
    private Item item;

    //Constructors

    public Wishlist(User user, Item item) {
        this.user = user;
        this.item = item;
    }

    public Wishlist() {}

    //Getters & Setters

    public User getUser() {return user;}

    public void setUser(User user) {this.user = user;}

    public Item getItem() {return item;}

    public void setItem(Item item) {this.item = item;}

}
