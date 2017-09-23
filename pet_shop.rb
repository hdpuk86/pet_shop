
def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  total_cash = shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  pets_sold = shop[:admin][:pets_sold] += amount
end

def stock_count(shop)
  return shop[:pets].length()
end

def pets_by_breed(shop, breed)
  breeds = []
  for animal in shop[:pets]
    if animal[:breed].include?(breed)
      breeds.push(animal)
    end
  end
  return breeds
end

def find_pet_by_name(shop, name)
  for animal in shop[:pets]
    return animal unless animal[:name] != name
  end
  return
end

def remove_pet_by_name(shop, pet)
  for animal in shop[:pets]
    if animal.value?(pet)
      shop[:pets].delete(animal)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_pet_count(customer)
  counter = customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if pet == nil || customer_can_afford_pet(customer, pet) == false
    return "Cannot complete sale"
  else
    remove_pet_by_name(shop, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(shop, 1)
    customer[:cash] -= pet[:price]
    add_or_remove_cash(shop, pet[:price])
  end
end
