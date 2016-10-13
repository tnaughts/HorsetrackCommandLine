#seed file, validations set on model, so multiple seeds will not create duplicates
Horse.create(name: 'That Darn Gray Cat', number: 1, odds: 5)
Horse.create(name: 'Fort Utopia', number: 2, odds: 10)
Horse.create(name: 'Count Sheep', number: 3, odds: 9)
Horse.create(name: 'Ms Traitour', number: 4, odds: 4)
Horse.create(name: 'Real Princess', number: 5, odds: 3)
Horse.create(name: 'Pa Kettle', number: 6, odds: 5)
Horse.create(name: 'Gin Stinger', number: 7, odds: 6)

if Money.first
	a = Money.create()
	Bill.create(money_id: a.id, inventory: 10, denomination: 1)
	Bill.create(money_id: a.id, inventory: 10, denomination: 5)
	Bill.create(money_id: a.id, inventory: 10, denomination: 10)
	Bill.create(money_id: a.id, inventory: 10, denomination: 20)
	Bill.create(money_id: a.id, inventory: 10, denomination: 100)
end