require 'json'

def hello(event:, context:)
  res = JSON.dump({
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event.fetch('body','body-not-found')
    }
  })
  return res
end
