package org.LaunchCode.IT_Wizards_API.services;

import org.LaunchCode.IT_Wizards_API.exceptions.ItemNotFoundException;
import org.LaunchCode.IT_Wizards_API.exceptions.UserNotFoundException;
import org.LaunchCode.IT_Wizards_API.exceptions.WishlistNotFoundException;
import org.LaunchCode.IT_Wizards_API.models.Item;
import org.LaunchCode.IT_Wizards_API.models.User;
import org.LaunchCode.IT_Wizards_API.models.Wishlist;
import org.LaunchCode.IT_Wizards_API.repository.ItemRepository;
import org.LaunchCode.IT_Wizards_API.repository.UserRepository;
import org.LaunchCode.IT_Wizards_API.repository.WishlistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistService {

    @Autowired
    private WishlistRepository wishlistRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ItemRepository itemRepository;

    public List<Wishlist> getWishlistByUserId(Long userId) {
        return wishlistRepository.findByUserId(userId);
    }

    public Wishlist addItemToWishlist(Long userId, Long itemId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new UserNotFoundException(userId));
        Item item = itemRepository.findById(itemId).orElseThrow(() -> new ItemNotFoundException(itemId));
        Wishlist wishlist = new Wishlist(user, item);
        return wishlistRepository.save(wishlist);
    }

    public void removeItemFromWishlist(Long userId, Long itemId) {
        Wishlist wishlistItem = wishlistRepository.findByUserIdAndItemId(userId, itemId)
                .orElseThrow(() -> new WishlistNotFoundException(userId, itemId));
        wishlistRepository.delete(wishlistItem);
    }
}
