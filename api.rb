require 'httparty'
require 'colorize'

response= HTTParty.get('https://openexchangerates.org/api/latest.json?app_id=fa9835c40a7f46a88e97fb4ea22f8e9c')

# getting hash from API

exchange_rate=response.parsed_response['rates']

# taking amount from the user
puts "===================================".colorize(:green)
print "     Enter your amount =       ".colorize(:blue)
puts ""
puts "===================================".colorize(:green)
begin
    amount=Float(gets)
    rescue ArgumentError
        puts "Enter amount in numbers!!!".colorize(:red)
    retry
end

#taking base currency from user
puts "===================================".colorize(:green)
puts "Enter your amount's currency".colorize(:blue)
puts "===================================".colorize(:green)
begin
           
     base = gets.chomp.upcase.strip
    raise "ok" unless exchange_rate.keys.include?(base)
    rescue
        puts "Enter valid currency key".colorize(:red)
    retry
end

# print "Enter your amount's currency".colorize(:blue)
# begin
#     base=gets.chomp.upcase.strip
#     raise "ok" if exchange_rate.has_key?(base)
#     rescue
#         puts "Enter valid currency key".colorize(:red)
#     retry
# end

#taking target currency from user
puts "===================================".colorize(:green)
puts "Enter your amount's target currency".colorize(:blue)
puts "===================================".colorize(:green)
begin
    target=gets.chomp.upcase.strip
    raise "Correct currency " unless exchange_rate.keys.include?(target)
    rescue
        puts "Enter correct currency key ".colorize(:red)
    retry
end

#making method for money conversion

def convertMoney(base,target,amount,exchange_rate)
    basecurrency=exchange_rate[base]
    targetcurrency=exchange_rate[target]
    converted_amount = (amount / basecurrency) * targetcurrency
    puts "===========================================================================".colorize(:green)
    puts "Your amount of #{amount} #{base} convert to #{target} = #{converted_amount}".colorize(:yellow)
    puts "===========================================================================".colorize(:green)
    

end
puts convertMoney(base,target,amount,exchange_rate)




