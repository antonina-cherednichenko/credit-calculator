class CreditCalculator
  attr_accessor :result_string, :rate, :sum, :period

  def initialize(rate, sum, period)
    @rate = rate
    @sum = sum
    @period = period
  end

  def payment_history
     add_start_header
     month_main_debt = (@sum / @period).round(2)
     credit_rest = @sum
     percent_total = 0.0
     period.times do |i|
       month_percent = (credit_rest * @rate / (@period * 100)).round(2)
       to_pay = (month_main_debt + month_percent)
       add_monthly_payment(i, credit_rest, month_percent, month_main_debt, to_pay)
       credit_rest = (credit_rest - month_main_debt).round(2)
       percent_total += month_percent
     end
     add_end_header(percent_total)
  end

  private

  def add_start_header
    @result_string = "<h3> Credit sum: #{@sum}<br>
                  Credit period, month: #{@period}<br>
                  Credit rate: #{@rate}%</h3>"
    @result_string << '<table border="1" style="width:100%">
                    <tr>
                       <th>Number of payment</th>
                       <th>Credit debt</th>
                       <th>Montly rate</th>
                       <th><Main debt</th>
                       <th>Montly pay</th>
                    </tr>'
  end

  def add_monthly_payment(num, credit_rest, month_percent, month_main_debt, to_pay)
     @result_string << "<tr>
                   <td> #{ num + 1} </td>
                   <td> #{credit_rest} </td>"
      @result_string << "<td>#{month_percent}</td>
                  <td>#{month_main_debt}</td>
                  <td>#{to_pay}</td>
                  </tr>"
  end

  def add_end_header(percent_total)
     @result_string << '<tr style="background-color:yellow">'
     @result_string << "<td>Total</td>
                    <td></td>
                    <td>#{percent_total}</td>
                    <td>#{@sum}</td>
                     <td>#{@sum + percent_total}</td></b>
                </tr>
                </table>"
  end
end
