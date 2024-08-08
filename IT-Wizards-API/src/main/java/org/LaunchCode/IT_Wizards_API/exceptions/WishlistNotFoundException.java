package org.LaunchCode.IT_Wizards_API.exceptions;

public class WishlistNotFoundException extends RuntimeException{
    public WishlistNotFoundException(Long userId, Long itemId) {
        super("Could not find the wishlist item with userId " + userId + " and itemId " + itemId);
    }
}
