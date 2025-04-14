//
//  DataHelper.swift
//  Foozy
//
//  Created by Griselda Shavilla on 08/04/25.
//

final class DataHelper {
    static func loadRestaurants() -> [Restaurant] {
        return [
            Restaurant(
                name: "Bebek Bengil",
                cuisine: "Indonesian",
                priceLevel: 3,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: true,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Bebek Bengil – Home of the Original Crispy Duck Since 1990\n\nIndulge in a delightful culinary experience where rich Balinese flavors meet a serene and tranquil ambiance. At Bebek Bengil, every bite of our signature crispy duck takes you on a journey of taste and tradition, while the peaceful surroundings offer a perfect escape from the hustle and bustle of daily life. Immerse yourself in authentic Balinese cuisine and let the rejuvenating atmosphere elevate your dining experience to pure bliss.",
                phoneNumber: "(021)50386630",
                email: "om.thebreeze@bebekbengil.co.id",
                images: [
                    "BebekbengilFood1", "BebekbengilFood3", "BebekbengilResto2",
                    "BebekbengilResto3",
                ]
            ),
            Restaurant(
                name: "Burgreens",
                cuisine: "Western",
                priceLevel: 1,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: true,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Burgreens – Indonesia’s Premier Plant-Based Culinary Experience \n\nBurgreens is Indonesia’s leading plant-based food chain, offering a delicious fusion of Asian and Western cuisines crafted entirely from natural ingredients. Every dish, from juicy plant-based burgers to flavorful rendang, bibimbap, and even vegan boba, is made from scratch—free from MSG, preservatives, artificial colorings, and harmful chemicals. Rooted in culinary innovation and local empowerment, Burgreens welcomes everyone, whether you're vegan, vegetarian, or simply looking to enjoy wholesome, guilt-free comfort food.",
                phoneNumber: "088290277666",
                email: "e.burgreens.thebreeze@gmail.com",
                images: [
                    "BurgreensFood1", "BurgreensFood4", "BurgreensResto1",
                    "BurgreensResto3",
                ]
            ),
            Restaurant(
                name: "Fire Prawn",
                cuisine: "Chinese",
                priceLevel: 2,
                isHalal: false,
                isNonHalal: true,
                isIndoor: true,
                isOutdoor: true,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Fire Prawn – A Fiery Culinary Journey Through Authentic Chinese Flavors \n\nStep into Fire Prawn and embark on an unparalleled culinary adventure, where tradition meets innovation in the heart of Tangerang at The Breeze. This vibrant dining destination brings authentic Chinese flavors to life, crafting each dish into a masterpiece of taste and artistry. Experience the magic of Fire Prawn, where every bite is a celebration of rich, time-honored flavors reimagined with a modern twist.",
                phoneNumber: "085774457362",
                email: "-",
                images: [
                    "FireprawnFood2", "FireprawnFood3", "FireprawnFood4",
                    "FireprawnResto1",
                ]
            ),
            Restaurant(
                name: "Gubug Makan Mang Engking",
                cuisine: "Indonesian",
                priceLevel: 2,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: true,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Gubug Makan Mang Engking – A Taste of Authentic Sundanese Cuisine \n\nExperience the rich flavors of Sundanese cuisine at Gubug Makan Mang Engking, located in The Breeze BSD City. Surrounded by serene fish ponds and traditional huts, this restaurant offers a truly authentic dining atmosphere that immerses you in nature. Our menu features a variety of flavorful dishes made from the finest ingredients, ensuring a delightful culinary experience. For a modern touch, we've added healthier options to some of our classic Sundanese recipes—giving you more reasons to come back for another taste of tradition and freshness!",
                phoneNumber: "085817899798",
                email: "admin@mangengkinggroup.co.id",
                images: [
                    "GubugengkingFood1", "GubugengkingResto1",
                    "GubugengkingResto2",
                ]
            ),
            Restaurant(
                name: "Hachi Grill",
                cuisine: "Japanese",
                priceLevel: 4,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: false,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Hachi Grill – A Yakiniku & Shabu-Shabu Experience Like No Other \n\nAt Hachi Grill The Breeze, indulge in premium cuts of meat and fresh hydroponic vegetables at unbeatable prices. Elevate your yakiniku and shabu-shabu experience with our signature soups and sauces, crafted to bring out the best flavors. Enjoy the comfort of a smokeless roaster and personal induction stove, allowing you to cook just the way you like. With a variety of delicious side dishes and a customizable dessert selection, all set in a sleek, minimalist, and industrial-chic ambiance, Hachi Grill is the perfect place to unwind and savor every moment.",
                phoneNumber: "081197116741",
                email: "cs@hachigroup.id",
                images: [
                    "HachigrillFood2", "HachigrillFood3", "HachigrillFood4",
                    "HachigrillResto1",
                ]
            ),
            Restaurant(
                name: "Ikkudo Ichi",
                cuisine: "Japanese",
                priceLevel: 2,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: false,
                isSmokingFriendly: false,
                isNonSmoking: true,
                restaurantDescription:
                    "Ikkudo Ichi – Authentic Japanese Ramen with an Indonesian Twist\n\nSince 2012, Ikkudo Ichi has been serving authentic Japanese ramen, specially crafted to suit Indonesian tastes. With 13 outlets across Jabodetabek and more on the way, we’re bringing your favorite bowl of ramen closer to you. True to its name, which means “one house,” Ikkudo Ichi is the perfect place to gather with friends and family while savoring the rich, comforting flavors of expertly prepared ramen.",
                phoneNumber: "(021)55699186",
                email: "ikkudo.ichi@gmail.com",
                images: [
                    "IkkudoFood1", "IkkudoFood2", "IkkudoResto1",
                    "IkkudoResto2",
                ]
            ),
            Restaurant(
                name: "Gallura",
                cuisine: "Italian",
                priceLevel: 3,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: false,
                isSmokingFriendly: false,
                isNonSmoking: true,
                restaurantDescription:
                    "Gallura – A Taste of Italy in the Heart of BSD\n\nNestled in The Breeze BSD, Gallura invites you to savor the authentic flavors of Italy in a warm and inviting setting. Our menu features a delectable selection of traditional Italian dishes, from handcrafted pasta and wood-fired pizzas to fresh seafood and irresistible desserts. Every dish is made with premium ingredients and a passion for culinary perfection, ensuring a truly memorable dining experience. With elegant decor, cozy lighting, and attentive service, Gallura is the perfect destination for intimate dinners, family gatherings, or simply celebrating good food and great company. Come and experience the essence of Italy with us!",
                phoneNumber: "08881868899",
                email: "-",
                images: [
                    "GalluraFood1", "GalluraFood2", "GalluraResto2",
                    "GalluraResto1",
                ]
            ),
            Restaurant(
                name: "Jittlada Thai Cuisine",
                cuisine: "Thai",
                priceLevel: 3,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: true,
                isSmokingFriendly: true,
                isNonSmoking: false,
                restaurantDescription:
                    "Jittlada Thai Cuisine – A Royal Thai Dining Experience\n\nSawadika! Welcome to Jittlada Thai Cuisine, where authentic flavors meet elegant dining. Designed with a royal touch, our restaurant offers a warm and inviting atmosphere perfect for family gatherings. Indulge in Thailand’s finest culinary delights, made with fresh, high-quality ingredients. For a more exclusive experience, we provide two VIP rooms and a charming outdoor dining area, perfect for private events and home gatherings. Discover the true essence of Thai cuisine at Jittlada!",
                phoneNumber: "082127793603",
                email: "marketing@jittlada.com",
                images: ["JittladaFood1", "JittladaFood2", "JittladaResto1"]
            ),

        ]

    }

    static func getCuisines() -> [String] {
        return Array(Set(loadRestaurants().compactMap { $0.cuisine }))
    }
}
