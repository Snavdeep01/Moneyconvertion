begin
       print "Enter your amount's currency".colorize(blue)
       base=gets.chomp.upcase.strip
    raise "ok" if has_key?(base)
    rescue
        puts "Enter valid currency key".colorize(:red)
    retry
end
