db.createCollection("heroes");

db.heroes.insertMany([
    {
        _id: 1,
        name: "Spider-Man",
        city: "New York",
        power: ["Agility", "Web-Shooting"],
        defeatedVillains: 50
    },
    {
        _id: 2,
        name: "Batman",
        power: ["Martials Arts", "Detective Skills"],
        defeatedVillains: 200
    },
    {
        _id: 3,
        name: "Wonder Woman",
        city: "Themyscira",
        power: ["Super Strength", "Lasso"],
        defeatedVillains: 120
    }
]);


db.heroes.updateOne(
    { _id: 1 },
    {
        $push: {
            power: "Arachnid Sense"
        }
    }
);

db.heroes.updateOne(
    { _id: 2 },
    {
        $inc: {
            defeatedVillains: 10
        }
    }
);

db.heroes.updateOne(
    { _id: 3 },
    {
        $set: {
            city: "Amazonia"
        }
    }
);

db.heroes.updateOne(
    { _id: 2 },
    {
        $pull: {
            power: "Detective Skills"
        }
    }
);

db.heroes.find().pretty();