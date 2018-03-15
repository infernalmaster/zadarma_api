require 'test_helper'
require 'json'

class ZadarmaApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ZadarmaApi::VERSION
  end

  def client
    ::ZadarmaApi::Client.new(ENV['ZADARMA_KEY'], ENV['ZADARMA_SECRET'], true)
  end

  def test_it_makes_succesfull_get_query
    response = client.call '/v1/info/balance/', 'GET'

    assert_equal 'success', JSON.parse(response.body)['status']
  end

  def test_it_makes_succesfull_post_query
    response = client.call '/v1/sms/send/', 'POST', { number: '+380919347255',
                                                      message: 'Hello! there ='}

    assert_equal 'success', JSON.parse(response.body)['status']
  end
end
