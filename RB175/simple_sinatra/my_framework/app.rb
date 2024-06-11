require_relative 'monroe'
require_relative 'advice'

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = 200
      headers = {"content-type" => 'text/html'}
      response(status, headers) do
        erb :index
      end
    when '/advice'
      status = 200
      headers = {"content-type" => 'text/html'}
      piece_of_advice = Advice.new.generate
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end
    else
      status = 404
      headers = {"content-type" => 'text/html', "content-length" => '61'}
      response(status, headers) do
        erb :not_found
      end
    end
  end
end
