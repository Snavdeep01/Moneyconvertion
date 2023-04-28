require 'money'
I18n.config.available_locales = :en

module Ex_rate

  RATE = {
        'INR'=> {
            'INR': 1,
            'USD': 0.0122,
            'EUR': 0.011,
            'JPY': 1.6294,
            'GBP': 0.0098
        },
        'USD'=> {
            'INR': 81.97,
            'USD': 1,
            'EUR': 0.805,
            'JPY': 133.56,
            'GBP': 0.805
        },
        'EUR'=> {
            'INR': 89.9676,
            'USD': 1.098,
            'EUR': 1,
            'JPY': 146.65,
            'GBP': 0.8893
        },
        'JPY'=> {
            'INR': 0.6138,
            'USD': 0.0075,
            'EUR': 0.0068,
            'JPY': 1,
            'GBP': 0.006
        },
        'GBP'=> {
            'INR': 101.828,
            'USD': 1.2423,
            'EUR': 1.1314,
            'JPY': 165.91,
            'GBP': 1
        }
    }

    RATE.each do 
      |base_cur , ex_cur|
      ex_cur.each do 
        |exc_cur , conv_rate|
        Money.add_rate(base_cur,exc_cur,conv_rate)
        # puts "#{conv_rate}"
      end
    end

      
      def converter(amount,base_cur,ex_cur)
        rate=Money.from_amount(amount,base_cur)
        val=rate.exchange_to(ex_cur)
        puts "Money convert from #{base_cur} to #{ex_cur} = #{val.format}".colorize(:yellow)
      end
    

  end
