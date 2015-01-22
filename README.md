# Merch

## A shop that sells products

### To do:

1. Define my routes
	- in `config/routes/rb` define RESTful routes for resources.

2. Generate controller for primary resource
	- Define actions for endpoints
	- CRUD products
		- Read - before i can read any data i need a model...

3. Generate a Model
	- Product model will have a migration
	- list attributes in migration file
	- Run `rake db:migrate`
	- Seed the db
		- e.g. `Product.create({name: "Coffee cup", price: 500})`
		- `rake db:seed`

4. Create views for looking at the products

5. Create a form for adding data via the browser

6. Handle create and update actions

7. Provide destroy functionality

---

8. Think about other resources (users)
9. Add in paperclip image uploads

---

10. generate user model
11. run migration
12. seed users
13. generate controller
14. add 'foreign key' to products
15. setup ASSOCIATIONs


----

## Notes

### What is REST (and RESTfulness)?

REST stands fro REpresentational State transfer.

Techno babble speak for HTTP conventions expressed through server side code.

POST requests should CREATE _something_ in a DB
GET requests should READ _something_ from a DB
PUT/PATCH request should UPDATE _something_ in a DB
DELETE request should DESTROY _something_ in a DB

CRUD ought to be RESTful representations of HTTP verbs.


