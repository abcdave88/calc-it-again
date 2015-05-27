require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do 
  @operator = params[:operator]
  if @operator
      @first = params[:first].to_f
      @second = params[:second].to_f
      
      @result = case @operator
      when '+' then @first + @second
      when '-' then @first - @second
      when '/' then @first / @second
      when '*' then @first * @second
      end
  end
  erb :home
end

get '/power' do
  @first = params[:first]
  if @second = params[:second]
    @result = @first.to_f**@second.to_f
  end
  erb :power
end

get '/sqrt' do 
  @first = params[:first]
  if @first
      @result = Math.sqrt(@first.to_f)
  end
  erb :sqrt
end

get '/bmi' do 
  @height = params[:height]
  if @weight = params[:weight]
    @result = (@weight.to_f/(@height.to_f**2))
  end
  erb :bmi
end


get '/mortgage' do  
  @principal = params[:@principal]
  if @interest = params[:@interest]
    @interest /= 100
    @interest /= 12
    @n = params[:no_of_payments]
    @x = (1+@interest)**@n
    @result = @principal*@interest*@x/(@x-1)
  end
  erb :mortgage 
end


get '/trip' do
  @distance = params[:distance]
  @mpg = params[:mpg]
  @cost = params[:cost]
    if @speed = params[:speed]
      @length =  (@distance.to_f/@speed.to_f)
      @trip_cost = (@distance.to_f/@mpg.to_f)*@cost.to_f
    end
  erb :trip
end


