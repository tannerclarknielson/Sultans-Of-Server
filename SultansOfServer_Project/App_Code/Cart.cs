using System;
using System.Collections.Generic;


/// <summary>
/// This class represents a shopping cart with a list of CartItem objects
/// </summary>
public class Cart
{
   
    //items: a private generic list of CartItem objects that represents the items stored in the cart
    private List<CartItem> items = new List<CartItem>();

    //Items: a public property to access (get only) the items list
    public List<CartItem> Items
    {
        get { return items; }
    }

    //HasItems: a boolean property indicating whether the cart has items in it (count of items > 0)
    public bool HasItems
    {
        get { return items.Count > 0; }
    }

    // AddItem:  public method that adds a CartItem to the items list
    // Should return void and take four parameters:  id, name, price, quantity (values for the product to be added)
    // ****IMPORTANT*** If the product already exists in the items list, just update the quantity by one 
    public void AddItem(string id, string name, decimal price, int qty)
    {
        //check to see if item is already in cart
        bool isInCart = false;
        CartItem item = null;

        foreach (CartItem c in items)
        {
            if (id == c.ID)
            {
                isInCart = true;
                item = c;
            }
        }

        //use isInCart to either add new item or update quantity
        if (isInCart)  //increase the quantity by one
        {
            item.Quantity += 1;
        }
        else //instantiate a new CartItem and add it to the items list
        {
            CartItem newItem = new CartItem(id, name, price, qty);
            items.Add(newItem);
        }

    }

    // RemoveItem:  public method that removes a CartItem from the items list
    // Should return void and take one parameter: id (the id of the product to be removed)
   
    public void RemoveItem(string ItemID)
    {
        CartItem itemToRemove = null;

        foreach (CartItem item in items)
        {
            if (ItemID == item.ID)
            {
                itemToRemove = item;
            }
        }

        items.Remove(itemToRemove);

    }

    // UpdateQuantity: public method that updates the  quantity of an CartItem the items list. 
    // Should return void and take two parameters:  id, newQuantity (the id of the product and the new quantity)
    public void UpdateQuantity(int UpdateQty, string ItemID)
    {
        foreach (CartItem item in items)
        {
            if (ItemID == item.ID)
            {
                item.Quantity = UpdateQty;
            }
        }
    }

    // GetSubtotal: public method that returns the subtotal amount for all products the cart
    // The subtotal is the sum of price * quantity for each item
    public decimal GetSubTotal()
    {
        decimal totalAmount = 0;

        foreach (CartItem item in items)
        {
            totalAmount += item.Price * item.Quantity;
        }

        return totalAmount;
    }

    // GetShipping: public method that returns the shipping amount for all products the cart
    // Assume that the shipping amount is 15% of the cart subtotal
    public decimal GetShipping()
    {
        return GetSubTotal() * 0.15M;
    }

    // GetTotal: public method that returns the total amount for all products the cart
    // The total is the subtotal plus shipping
    public decimal GetTotal()
    {
        return GetSubTotal() + GetShipping();
    }

    // Empty constructor
    public Cart()
    {

    }




}
