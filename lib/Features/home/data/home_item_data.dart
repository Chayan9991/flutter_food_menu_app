final List<Map<String, String>> categories = [
  {"name": "All", "image": "assets/images/all.png"},
  {"name": "Coffee", "image": "assets/images/coffee.png"},
  {"name": "Tea", "image": "assets/images/tea.png"},
  {"name": "Pizza", "image": "assets/images/pizza.png"},
  {"name": "Burger", "image": "assets/images/burger.png"},
];

final Map<String, List<Map<String, dynamic>>> items = {
  "All": [
    {
      "id": 1,
      "name": "Espresso",
      "category": "Coffee",
      "image":
          "https://images.pexels.com/photos/685527/pexels-photo-685527.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 10,
      "isPopular": false,
      "description":
          "A strong and bold coffee shot, perfect for coffee lovers.",
      "allergens": ["None"],
    },
    {
      "id": 2,
      "name": "Latte",
      "category": "Coffee",
      "image":
          "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 11,
      "isPopular": false,
      "description": "A creamy coffee with steamed milk and a touch of foam.",
      "allergens": ["Dairy"],
    },
    {
      "id": 3,
      "name": "Green Tea",
      "category": "Tea",
      "image":
          "https://images.pexels.com/photos/6099158/pexels-photo-6099158.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 12,
      "isPopular": false,
      "description": "A soothing tea made with premium green tea leaves.",
      "allergens": ["None"],
    },
    {
      "id": 4,
      "name": "Pepperoni Pizza",
      "category": "Pizza",
      "image":
          "https://images.pexels.com/photos/18912713/pexels-photo-18912713/free-photo-of-pizza-with-mozzarella-shaped-as-ghosts-for-halloween.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 13,
      "isPopular": true,
      "description": "A classic pizza topped with spicy pepperoni and cheese.",
      "allergens": ["Gluten, Dairy"],
    },
    {
      "id": 5,
      "name": "Cheeseburger",
      "category": "Burger",
      "image":
          "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 14,
      "isPopular": false,
      "description":
          "A juicy burger layered with melted cheese and fresh toppings.",
      "allergens": ["Gluten, Dairy"],
    },
  ],
  "Coffee": [
    {
      "id": 6,
      "name": "Espresso",
      "category": "Coffee",
      "image":
          "https://images.pexels.com/photos/685527/pexels-photo-685527.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 15,
      "isPopular": false,
      "description": "A concentrated coffee shot for a bold flavor experience.",
      "allergens": ["None"],
    },
    {
      "id": 7,
      "name": "Latte",
      "category": "Coffee",
      "image":
          "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 16,
      "isPopular": false,
      "description": "Rich coffee blended with steamed milk and foam.",
      "allergens": ["Dairy"],
    },
    {
      "id": 8,
      "name": "Cappuccino",
      "category": "Coffee",
      "image":
          "https://images.pexels.com/photos/143646/pexels-photo-143646.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 17,
      "isPopular": true,
      "description": "A perfectly balanced coffee with steamed milk and froth.",
      "allergens": ["Dairy"],
    },
  ],
  "Tea": [
    {
      "id": 9,
      "name": "Green Tea",
      "category": "Tea",
      "image":
          "https://images.pexels.com/photos/6099158/pexels-photo-6099158.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 18,
      "isPopular": false,
      "description":
          "A calming and refreshing beverage made from green tea leaves.",
      "allergens": ["None"],
    },
    {
      "id": 10,
      "name": "Black Tea",
      "category": "Tea",
      "image":
          "https://images.pexels.com/photos/1493080/pexels-photo-1493080.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 19,
      "isPopular": false,
      "description": "Strong and robust tea brewed from black tea leaves.",
      "allergens": ["None"],
    },
    {
      "id": 11,
      "name": "Masala Chai",
      "category": "Pizza",
      "image":
          "https://images.pexels.com/photos/5946623/pexels-photo-5946623.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 20,
      "isPopular": false,
      "description":
          "Spiced Indian tea made with milk and a blend of aromatic spices.",
      "allergens": ["Dairy"],
    },
  ],
  "Pizza": [
    {
      "id": 12,
      "name": "Pepperoni Pizza",
      "category": "Pizza",
      "image":
          "https://images.pexels.com/photos/18912713/pexels-photo-18912713/free-photo-of-pizza-with-mozzarella-shaped-as-ghosts-for-halloween.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 21,
      "isPopular": false,
      "description": "Topped with spicy pepperoni and gooey mozzarella cheese.",
      "allergens": ["Gluten, Dairy"],
    },
    {
      "id": 13,
      "name": "Margherita Pizza",
      "category": "Pizza",
      "image":
          "https://images.pexels.com/photos/10068752/pexels-photo-10068752.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 12,
      "isPopular": true,
      "description": "A simple pizza with fresh tomato, basil, and mozzarella.",
      "allergens": ["Gluten, Dairy"],
    },
    {
      "id": 14,
      "name": "BBQ Chicken Pizza",
      "category": "Pizza",
      "image":
          "https://images.pexels.com/photos/11485215/pexels-photo-11485215.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 13,
      "isPopular": false,
      "description":
          "Loaded with BBQ chicken, onions, and tangy barbecue sauce.",
      "allergens": ["Gluten, Dairy"],
    },
  ],
  "Burger": [
    {
      "id": 15,
      "name": "Cheeseburger",
      "category": "Burger",
      "image":
          "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 14,
      "isPopular": false,
      "description":
          "A juicy beef patty topped with melted cheese and fresh veggies.",
      "allergens": ["Gluten, Dairy"],
    },
    {
      "id": 16,
      "name": "Veggie Burger",
      "category": "Burger",
      "image":
          "https://images.pexels.com/photos/1199958/pexels-photo-1199958.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 15,
      "isPopular": false,
      "description": "A plant-based patty loaded with vegetables and spices.",
      "allergens": ["Gluten"],
    },
    {
      "id": 17,
      "name": "Chicken Burger",
      "category": "Burger",
      "image":
          "https://images.pexels.com/photos/918581/pexels-photo-918581.jpeg?auto=compress&cs=tinysrgb&w=600",
      "rating": "5",
      "price": 16,
      "isPopular": true,
      "description": "Crispy chicken patty topped with lettuce and mayo.",
      "allergens": ["Gluten, Egg"],
    },
  ],
};
