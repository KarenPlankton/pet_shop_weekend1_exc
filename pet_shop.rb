def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  pet_shop[:admin][:total_cash]=pet_shop[:admin][:total_cash] + amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,add_pet)
  pet_shop[:admin][:pets_sold]=pet_shop[:admin][:pets_sold] + add_pet
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop,breed)
  a=pet_shop[:pets].select do|pet|
    pet[:breed] == breed
  end
  return a
end

def find_pet_by_name(pet_shop,pet_name)
  arthur=pet_shop[:pets].find do |pet|
    pet[:name]== pet_name
  end
  return arthur
end

def remove_pet_by_name(pet_shop,pet_name)
  pet=find_pet_by_name(pet_shop,pet_name)
  pet_shop[:pets].delete(pet)
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash_to_rmv)
   customer[:cash]= customer[:cash]-cash_to_rmv
  return customer[:cash]
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer,new_pet)
customer[:pets].push(new_pet)
end

# --- OPTIONAL ---
def customer_can_afford_pet(customer, new_pet)
  if customer[:cash]>= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet==nil || customer_can_afford_pet(customer,pet)==false
    puts "pet not fount or insuffucuent funds"
  else
    customer[:pets].push(pet)
    remove_pet_by_name(pet_shop,pet[:name])
    pet_shop[:admin][:pets_sold]+=1
    pet_price=pet[:price]
    customer[:cash]=customer[:cash]-pet_price
    pet_shop[:admin][:total_cash]=pet_shop[:admin][:total_cash]+pet_price
  end
end
