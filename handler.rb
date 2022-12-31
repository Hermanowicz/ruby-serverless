require 'json'
require 'faker'
require_relative 'helpers'

include Helpers

def hello(event:, context:)
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "hello" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  return res
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
  return res
end

def bye(event:, context:)
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "bye" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  return res
end

def testing(event:, context:)
  res = Helpers.get_do_s3_secret
  puts "Res: #{res}"
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "testing" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  return res
end


def list_bucket_objects(event:, context:)
  res = Helpers.list_objects_in_do
  puts "Res: #{res}"
  res = JSON.dump({
                    statusCode: 200,
                    body: {
                      message: 'Go Serverless v1.0! Your function "list_bucket_objects" executed successfully!',
                      input: event.fetch('body', 'body-not-found')
                    }
                  })
  return res
end