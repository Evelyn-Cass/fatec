// Operadores

// -eq, ne, gt, lt, gte, lte

// -- comandos usados

// use stock
db.createCollection("products")

db.products.insertMany([
    {
        "_id": 1,
        "name": "Smartphone Samsung",
        "category": "Smartphone",
        "price": 500,
        "stock": 30,
        "stars": 4.5
    },
    {
        "_id": 2,
        "name": "Dell Notebook",
        "category": "Notebook",
        "price": 1500,
        "stock": 25,
        "stars": 4.7
    },
    {
        "_id": 3,
        "name": "Apple Notebook",
        "category": "Notebook",
        "price": 3500,
        "stock": 50,
        "stars": 5
    }
])

// $eq = equal
db.products.find({ price: { $eq: 500 } })

// $ne = not equal
db.products.find({ price: { $ne: 500 } })

// $gt = greater than
db.products.find({ price: { $gt: 500 } })

// $lt = less than
db.products.find({ price: { $lt: 500 } })

// $gte = greater than or equal
db.products.find({ price: { $gte: 500 } })

// $lte = less than or equal
db.products.find({ price: { $lte: 500 } })

// Logical Operators

// -and, or, not, nor

// $and = and
db.products.find(
    {
        $and:
            [{ price: { $gte: 500 } }, { price: { $lte: 1500 } }]
    })

// $or = or
db.products.find(
    {
        $or:
            [{ price: { $gte: 500 } }, { price: { $lte: 1500 } }]
    })

// $not = not
db.products.find(
    {
        price: {
            $not: { $eq: 500 }
        }
    }
)

// $nor = nor
db.products.find(
    {
        $nor: [
            { price: { $eq: 500 } },
            { price: { $eq: 1500 } }
        ]
    }
)

// Element Operators

// -exists, type

// $exists = exists
db.products.find(
    {
        price: { $exists: true }
    }
)

// $type = type
db.products.find(
    {
        "price": {
            $type: "double"
        }
    }
)

// Questions

// 1.
db.products.find(
    {
        "price": {
            $gte: 2000,
        }
    }
)

// 2.
db.products.find(
    {
        $and: [
            { "category": "notebook" },
            { "stars": { $gte: 4.5 } }
        ]
    }
)

// 3.
db.products.find(
    {
        $or: [
            { "price": { $lt: 2000 } },
            { "stock": { $gt: 20 } }
        ]
    }
)

// 4.
db.products.find(
    {
        "stars":
            { $exists: true }
    }
)

// 5.
db.products.find(
    {
        $nor: [
            {"category": "Notebook"}, 
            {"price": { $gte: 3000 }}
        ]
    }
)