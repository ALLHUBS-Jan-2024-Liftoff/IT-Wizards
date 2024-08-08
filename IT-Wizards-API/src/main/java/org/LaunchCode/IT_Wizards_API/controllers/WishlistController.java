package org.LaunchCode.IT_Wizards_API.controllers;

import org.LaunchCode.IT_Wizards_API.exceptions.WishlistNotFoundException;
import org.LaunchCode.IT_Wizards_API.models.Wishlist;
import org.LaunchCode.IT_Wizards_API.repository.WishlistRepository;
import org.LaunchCode.IT_Wizards_API.services.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/wishlist")
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    @GetMapping("/{userId}")
    public List<Wishlist> getWishlist(@PathVariable Long userId) {
        return wishlistService.getWishlistByUserId(userId);
    }

    @PostMapping("/{userId}/{itemId}")
    public Wishlist addItem(@PathVariable Long userId, @PathVariable Long itemId) {
        return wishlistService.addItemToWishlist(userId, itemId);
    }

    @DeleteMapping("/{userId}/{itemId}")
    public void removeItem(@PathVariable Long userId, @PathVariable Long itemId) {
        wishlistService.removeItemFromWishlist(userId, itemId);
    }
}
