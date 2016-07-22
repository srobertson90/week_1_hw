def pet_shop_name(shop)
  return shop[:name]
end

def total_cash (shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, cash)
  return shop[:admin][:total_cash] += cash
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, sold)
  return shop[:admin][:pets_sold] += sold
end

def stock_count(shop)
 return shop[:pets].length
end

def pets_by_breed(shop, breed_name)
  of_breed = []
  for pet in shop[:pets] do
    of_breed << [:name] if pet[:breed] == breed_name
  end
  return of_breed
end

def find_pet_by_name(shop, pet_name)
  pet_found = nil
  for pet in shop[:pets] do
    pet_found = pet if pet[:name] == pet_name
  end
  return pet_found
end

def remove_pet_by_name(shop, pet_name)
  for pet in shop[:pets] do
    shop[:pets].delete(pet) if pet[:name] == pet_name
  end
end

def add_pet_to_stock(shop, new_pet)
  return shop[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price] 
    return true
  else false 
  end
end

def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
    return nil
  else 
    if customer_can_afford_pet(customer, pet) == true
      add_pet_to_customer(customer, pet)
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet[:price])
    end
  end
end

