require 'sinatra'
require 'eventmachine'

configure do
  mime_type :json, 'application/json'
end

get '/' do
  p 'aaaaaaaaaaaaaa'
  '<a href="/async">start operation</a>'
end

get '/async' do
  operation = proc {
    p 'operation started!'
    10.times do |i|
      puts "#{i} times Hello, Async!"
      sleep 1
    end
  }
  callback = proc {|result|
    p 'operation finished!'
  }
  EventMachine.defer(operation, callback)
  redirect '/'
end

