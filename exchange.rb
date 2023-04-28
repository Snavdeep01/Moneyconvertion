require 'money'
require 'colorize'
require_relative 'mod'
I18n.config.available_locales = :en


# # dollar to INR
# class Exchange
#   def initialize(amount, target_currency)
#     @amount = amount
#     @target_currency = target_currency
#   end

#   def convert
#     puts "This is blue".colorize(:red)
#     money = Money.from_cents(7532, "USD")
#     puts money.cents
#     puts money.currency 
#     # @amount * 80
#   end
# end

# ## driver logic
# ex = Exchange.new(5, 'INR')
# ex.convert


class Money_change
  include Ex_rate
end
ar=["INR","USD","EUR","JPY","GBP"]

print "Enter amount=".colorize(:red)
begin 
  amount=Float(gets)
rescue ArgumentError
    puts "Enter amount in numbers".colorize(:red)
    retry
end
puts "=============================================".colorize(:blue)
puts ""
puts "Enter base currency=".colorize(:green)
puts "Your base currency is INR".colorize(:green)
puts "Your base currency is USD".colorize(:green)
puts "Your base currency is EUR".colorize(:green)
puts "Your base currency is JPY".colorize(:green)
puts "Your base currency is GBP".colorize(:green)
puts ""
puts "=============================================".colorize(:blue)

begin
  base_cur=gets.chomp.upcase.strip
  raise until ar.include?(base_cur)
    
  rescue
    puts "exception in input - please enter a valid base currency".colorize(:red)
    retry
end


puts "=============================================".colorize(:blue)
puts ""
puts "Here is a list in which you can convert your money :".colorize(:yellow)
puts " 1 . For convert in US dollor type  USD ".colorize(:yellow)
puts " 2 . For convert in Eur type  EUR".colorize(:yellow)
puts " 3 . For convert in JPY type  JPY".colorize(:yellow)
puts " 4 . For convert in GBP type  GBP".colorize(:yellow)
puts " "
puts "=============================================".colorize(:blue)

begin
  ex_cur=gets.chomp.upcase.strip
  raise until ar.include?(ex_cur)

  rescue
    puts "exception in input - please enter a valid base currency".colorize(:red)
    retry

end
# case ex_cur
#   when "USD" then
#     Money.add_rate("INR", "USD", 0.012)
#     ans=Money.from_cents(amount, "INR").exchange_to("USD")
#     puts ans
#   when "EUR" then
#     Money.add_rate("INR","EUR",0.011)
#     ans=Money.from_cents(amount,"INR").exchange_to("EUR")
#     puts ans
#   when "JPY" then 
#     Money.add_rate("INR","JPY",1.64)
#     ans=Money.from_cents(amount,"INR").exchange_to("JPY")
#     puts ans
  
#   when "GBP" then
#     Money.add_rate("INR","GBP",0.0098)
#     ans=Money.from_cents(amount,"INR").exchange_to("GBP")
#     puts ans

#   else
#     puts "wrong input"
# end

mobj=Money_change.new
mobj.converter(amount,base_cur,ex_cur)



