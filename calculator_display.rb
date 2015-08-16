#Let's create a simple calculator app together, it should have a get method for localhost:4567/calculator that displays two forms
# the first form should post (note that post is one of those http methods) to localhost:4567/add, and have two fields named "num1" and "num2"
# the second form should post to localhost:4567/subtract with the same args
# the page that they go to should display the result, and have a link to get back to calculator

require 'rubygems'
require 'sinatra'
require_relative 'calculator.rb'

get '/calculator' do
'
<form action="/calculate" method="post" accept-charset="utf-8">
	Interest rate (%): <input type="text" name="rate" value="" id="rate">
	Total sum: <input type="text" name="sum" value="" id="sum">
	Period in months: <input type="text" name="period" value="" id="period">
  <br><input type="submit" value="Calculate">
</form>
'
end


post '/calculate' do
  "#{CreditCalculator.payment(params[:rate].to_f, params[:sum].to_f, params[:period].to_i)}
  <br>
  <a href='/calculator'>Back</a>"
end

