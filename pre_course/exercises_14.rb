# exercises_14.rb

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}


contact_keys = [:email, :address, :phone]

contacts.each_key do |k|
  contact_keys.each do |ck|
    contacts[k][ck] = contact_data.first.shift
  end
  contact_data.shift
end


puts contacts