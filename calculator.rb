class CreditCalculator
  def self.payment(rate, sum, period)
    result = "<h3> Credit sum: #{sum}<br>
                  Credit period, month: #{period}<br>
                  Credit rate: #{rate}%</h3>"
    result << '<table border="1" style="width:100%">
                    <tr>
                       <th>Number of payment</th>
                       <th>Credit debt</th>
                       <th>Montly rate</th>
                       <th><Main debt</th>
                       <th>Montly pay</th>
                    </tr>'
     month_main_debt = (sum / period).round(2)
     credit_rest = sum
     percent_total = 0.0
     sum_total = 0.0
     period.times do |i|
       result << "<tr>
                   <td> #{ i + 1} </td>
                   <td> #{credit_rest} </td>"
       month_percent = (credit_rest * rate / (period * 100)).round(2)
       to_pay = (month_main_debt + month_percent)
       credit_rest = (credit_rest - month_main_debt).round(2)
       percent_total += month_percent
       sum_total += to_pay
       result << "<td>#{month_percent}</td>
                  <td>#{month_main_debt}</td>
                  <td>#{to_pay}</td>
                  </tr>"
     end
     result << '<tr style="background-color:yellow">'
     result << "<td>Total</td>
                    <td></td>
                    <td>#{percent_total}</td>
                    <td>#{sum}</td>
                     <td>#{sum_total}</td></b>
                </tr>
                </table>"
  end
end
