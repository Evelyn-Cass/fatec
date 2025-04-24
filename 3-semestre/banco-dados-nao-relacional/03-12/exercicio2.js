db.createCollection("menu");

db.menu.insertMany([
    {
        _id: 1,
        name: "Pizza",
        ingredients: ["Dough", "Tomato Sauce", "Cheese"],
        price: 30
    },
    {
        _id: 2,
        name: "Sushi",
        price: 40,
        ingredients: ["Rice", "Fish", "Seaweed"]
    },
    {
        _id: 3,
        name: "Taco",
        price: 15,
        ingredients: ["Tortilla", "Beef", "Cheese"]
    }
]);

db.menu.updateMany(
    {},
    {
        $mul: {
            price: 1.1
        }
    }
);

db.menu.updateOne(
    { name: "Taco"},
    {
        $push: {
            ingredients: "Guacamole"
        }
    }
);

db.menu.updateOne(
    { name: "Sushi"},
    {
        $set:
        {
            price: 35
        }
    }
);

db.menu.updateOne(
    {
        name:"Taco"
    },
    {
        $set: {
            ingredients: ["Tortilla", "Chicken", "Cheese", "Guacamole"]
        }
    }
);


db.menu.find().pretty();