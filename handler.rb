require 'json'
require 'faker'

def hello(event:, context:)
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "hello" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  res
end

def rand_user(event:, context:)
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Fake user',
                      user: {
                        f_name: Faker::Name.name,
                        address: Faker::Address.full_address,
                        currency: Faker::Currency.code,
                        last_login: Faker::Date.backward(days: 21)
                      }
                    }
                  })
  res
end

def bye(event:, context:)
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "bye" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  res
end