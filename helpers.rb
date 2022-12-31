require 'aws-sdk-secretsmanager'
require 'aws-sdk-s3'

module Helpers
  def create_do_s3_client(secret)
    "" "
  Creating client for Digital Ocean spaces, (S3 compatible object store).
  " ""
    begin
      client = Aws::S3::Client.new(
        access_key_id: secret.fetch(:key),
        secret_access_key: secret.fetch(:secret),
        endpoint: secret.fetch(:endpoint),
        force_path_style: false,
        region: 'eu-central-1'
      )
    rescue StandardError => e
      puts "There was an error while calling #create_do_s3_client: #{e.full_message}"
    end
  end



  def get_do_s3_secret
    "" "
  Creating client and reading secret with data to connect to DO S3.
  " ""
    client = Aws::SecretsManager::Client.new(region: 'eu-central-1')

    begin
      get_secret_value_response = client.get_secret_value(secret_id: 'poc/s3-sync')
    rescue StandardError => e
      puts "There was an error while calling #get_do_s3_secret: #{e.full_message}"
    end

    secret = get_secret_value_response.secret_string
  end
end