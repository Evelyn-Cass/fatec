
db.createCollection("users");

db.users.insertMany([
    {
        _id: 1,
        username: "João",
        age: 24,
        active: true,
        premium: false,
        hobbies: ["reading", "soccer"],
        tasks: [
            {
                title: "Study MongoDB",
                Status: "Pending"
            }
        ]
    },
    {
        _id: 2,
        username: "Maria",
        age: 30,
        active: false,
        premium: true,
        hobbies: ["cooking", "yoga"],
        tasks: [
            {
                title: "Complete Project",
                Status: "Done"
            }
        ]
    },
    {
        _id: 3,
        username: "Carlos",
        age: 35,
        active: true,
        premium: false,
        hobbies: ["gaming", "music"],
        tasks: [
            {
                title: "Write a report",
                Status: "Pending"
            }
        ]
    }
]);

//UpdateOne(filter, update, options)
//UpdateOne() is used to update a single document that matches the filter.
//In this example, we are updating the age and active fields for the user with the username Maria.
db.users.updateOne(
    { username: "Maria" },
    {
        $set: {
            age: 31,
            active: true
        }
    }
);

//UpdateMany(filter, update, options)
//UpdateMany() is used to update multiple documents that match the filter.
//In this example, we are updating the premium field to true for all active users.
db.users.updateMany(
    { active: true },
    {
        $set: {
            premium: true
        }
    }
);

//replaceOne(filter, replacement, options)
//replaceOne() is used to replace a document with another document.
//The replacement document must contain all the fields of the original document.
db.users.replaceOne(
    { username: "Carlos" },
    {
        username: "Carlos",
        age: 36,
        active: true,
        premium: true,
        hobbies: ["gaming", "music"],
        tasks: [
            {
                title: "Write a report",
                Status: "Pending"
            }
        ]
    }
);

//Modificators
// $set: Sets the value of a field in a document.
// $unset: Removes a field from a document.
// $rename: Renames a field in a document.
// $inc: Increments the value of a field by a specified amount.
// $mul: Multiplies the value of a field by a specified amount.
// $min: Only updates the field if the specified value is less than the current value.
// $max: Only updates the field if the specified value is greater than the current value.
// $currentDate: Sets the value of a field to the current date and time.
// $addToSet: Adds elements to an array field only if they do not already exist in the array.
// $push: Adds elements to an array field.

db.users.updateOne(
    { username: "João" },
    {
        $set: {
            age: 25
        }
    }
); // Sets the age field to 25 for the user with the username João


db.users.updateMany(
    { active: true },
    {
        $set: {
            premium: "true"
        }
    }
);  // Updates the premium field to the string "true" for all active users


db.users.replaceOne(
    { username: "Maria" },
    {
        _id: 2,
        username: "Maria",
        age: 31,
        active: true,
        premium: false,
        hobbies: []
    }
); // Replaces the document with the username Maria with the new document

db.users.updateOne(
    { username: "João" },
    {
        $set: {
            premium: true
        }
    }
); // Sets the premium field to true for the user with the username João
 
db.users.updateOne(
    { username: "Carlos"},
    {
        $unset: {
            premium: ""
        }
    }
); // Removes the premium field from the document

db.users.updateOne(
    { username: "Maria" },
    {
        $rename: {
            age: "yearsOld"
        }
    }
); // Renames the age field to yearsOld

db.users.updateOne(
    { username: "João" },
    {
        $inc: {
            age: 1
        }
    }
); // Increments the age field by 1

db.users.updateOne(
    {
        username: "Carlos"
    },
    {
        $mul: {
            age: 2
        }
    }
); // Multiplies the age field by 2

db.users.updateOne(
    { username: "João" },
    {
        $min: {
            age: 23
        }
    }
); // Updates the age field to 23 if the current value is greater than 23

db.users.updateOne(
    { username: "Maria" },
    {
        $max: {
            yearsOld: 35
        }
    }
); // Updates the yearsOld field to 35 if the current value is less than 35

db.users.updateOne(
    {username: "João"},
    {
        $push: {
            hobbies: "guitar"
        }
    }
); // Adds the "guitar" element to the hobbies array

db.users.updateOne(
    { username: "Maria" },
    {
        $pop: {
            hobbies: -1
        }
    }
); // Removes the last element from the hobbies array

db.users.updateOne(
    { username: "Carlos" },
    {
        $pull: {
            hobbies: "gaming"
        }
    }
); // Removes the "gaming" element from the hobbies array

db.users.updateOne(
    { username: "João" },
    {
        $addToSet: {
            hobbies: "Chess"
        }
    }
); // Adds the "reading" element to the hobbies array if it does not already exist

db.users.updateOne(
    { username: "João"},
    {
        $push: {
            hobbies: {
              $each: ["coding", "music"]
            }
        }
    }
); // Adds the "coding" and "music" elements to the hobbies array