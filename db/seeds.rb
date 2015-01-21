# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(
		[
			{
				name: 			"Beanie Hat",
				description: 	"Hockey teams from NHL and Int'l teams",
				price_in_pence: "9000"

			},

			{
				name: 			"Swatch Watch",
				description: 	"Watches from the '80s",
				price_in_pence: "5000"
			}
		]
	)

