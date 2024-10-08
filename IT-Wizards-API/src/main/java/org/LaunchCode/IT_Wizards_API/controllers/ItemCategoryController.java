package org.LaunchCode.IT_Wizards_API.controllers;

import org.LaunchCode.IT_Wizards_API.exceptions.DuplicateItemCategoryException;
import org.LaunchCode.IT_Wizards_API.repository.ItemCategoryRepository;

import org.LaunchCode.IT_Wizards_API.exceptions.ItemCategoryNotFoundException;
import org.LaunchCode.IT_Wizards_API.exceptions.ItemNotFoundException;
import org.LaunchCode.IT_Wizards_API.models.Item;
import org.LaunchCode.IT_Wizards_API.models.ItemCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;


@RestController
@RequestMapping("/itemCategories")
public class ItemCategoryController {
    @Autowired
    private ItemCategoryRepository itemCategoryRepository;

    @PostMapping()
    public ItemCategory createItem(@RequestBody ItemCategory newItemCategory){
        Optional<ItemCategory> checkCategory = itemCategoryRepository.findByName(newItemCategory.getName());
        if (checkCategory.isPresent()){
            throw new DuplicateItemCategoryException(newItemCategory.getName());
        }
        return itemCategoryRepository.save(newItemCategory);
    }

    @GetMapping()
    public Iterable<ItemCategory> getAllItemCategories(){
        return itemCategoryRepository.findAll();
    }

    @GetMapping("/{id}")
    public ItemCategory getItemCategoryByID(@PathVariable Long id){
        return itemCategoryRepository.findById(id)
                .orElseThrow(()->new ItemCategoryNotFoundException(id));
    }
    @PutMapping("/{id}")
    ItemCategory editItemCategory(@RequestBody ItemCategory editedItemCategory, @PathVariable Long id){
        return itemCategoryRepository.findById(id)
                .map(itemCategory->{
                    itemCategory.setName(editedItemCategory.getName());
                    return itemCategoryRepository.save(itemCategory);
                }).orElseThrow(()->new ItemCategoryNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    String deleteItem(@PathVariable Long id){
        if(!itemCategoryRepository.existsById(id)){
            throw new ItemCategoryNotFoundException(id);
        }
        itemCategoryRepository.deleteById(id);
        return "Item with id " +id+ " has been successfully deleted.";
    }

}