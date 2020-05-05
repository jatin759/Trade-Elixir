defmodule Trade.Request do
    # use HTTPoison
    @api_key "ff14bbb3954a44f509fdb2637ee262"
    @api_secret ""

    def generate_signature(secret, message) do
        :crypto.hmac(:sha256, secret, message) |> Base.encode16
    end
    
    def get_time_stamp do 
        DateTime.utc_now() |> DateTime.to_unix |> to_string
    end

    def testnet_get_order_request do
        # api_key = "ff14bbb3954a44f509fdb2637ee262"
        # api_secret = ""

        payload = ""
        method = "GET"
        timestamp = get_time_stamp()
        path = "/orders"
        query_string = "?state=open" # "?product_id=1&state=open"
        signature_data = method <> timestamp <> path <> query_string <> payload
        IO.puts(signature_data)
        signature = generate_signature(@api_secret, signature_data) |> String.downcase
        # signature = String.downcase(signature)
        IO.puts(signature)
        # IO.puts(is_bitstring(signature))

        query = %{state: "open"} # %{product_id: 1, state: "open"}

        request = %HTTPoison.Request{
          method: :get,
          url: "https://testnet-api.delta.exchange/orders",
          headers: [
            {"api-key", @api_key},
            {"timestamp", timestamp},
            {"signature", signature},
            {"User-Agent", "rest-client"},
            {"Content-Type", "application/json"},
          ],
          options: [],
          params: query,
          body: payload
        }

        response = HTTPoison.request(request)
        IO.inspect(response)
        IO.puts("Decoded")

    end

    def testnet_post_order_request do
        payload = %{
          order_type: "limit_order",
          size: 500,
          side: "sell",
          limit_price: "9110.0",
          product_id: 16
        } |> Poison.encode!

        IO.puts(payload)
        method = "POST"
        timestamp = get_time_stamp()
        path = "/orders"
        query_string = ""
        signature_data = method <> timestamp <> path <> query_string <> payload
        IO.puts(signature_data)
        signature = generate_signature(@api_secret, signature_data) |> String.downcase

        request = %HTTPoison.Request{
          method: :post,
          url: "https://testnet-api.delta.exchange/orders",
          headers: [
            {"api-key", @api_key},
            {"timestamp", timestamp},
            {"signature", signature},
            {"User-Agent", "rest-client"},
            {"Content-Type", "application/json"},
          ],
          options: [],
          params: %{},
          body: payload
        }

        response = HTTPoison.request(request)
        IO.inspect(response)
        IO.puts("Decoded")

    end

    def testnet_edit_order_request do
      payload = %{
        id: 25372917,
        size: 800,
        limit_price: "9150.0",
        product_id: 16
      } |> Poison.encode!

      IO.puts(payload)
      method = "PUT"
      timestamp = get_time_stamp()
      path = "/orders"
      query_string = ""
      signature_data = method <> timestamp <> path <> query_string <> payload
      IO.puts(signature_data)
      signature = generate_signature(@api_secret, signature_data) |> String.downcase

      request = %HTTPoison.Request{
        method: :put,
        url: "https://testnet-api.delta.exchange/orders",
        headers: [
          {"api-key", @api_key},
          {"timestamp", timestamp},
          {"signature", signature},
          {"User-Agent", "rest-client"},
          {"Content-Type", "application/json"},
        ],
        options: [],
        params: %{},
        body: payload
      }

      response = HTTPoison.request(request)
      IO.inspect(response)
      IO.puts("Decoded")

    end

    def testnet_delete_order_request do
      payload = %{
        id: 25372917,
        product_id: 16
      } |> Poison.encode!

      IO.puts(payload)
      method = "DELETE"
      timestamp = get_time_stamp()
      path = "/orders"
      query_string = ""
      signature_data = method <> timestamp <> path <> query_string <> payload
      IO.puts(signature_data)
      signature = generate_signature(@api_secret, signature_data) |> String.downcase

      request = %HTTPoison.Request{
        method: :delete,
        url: "https://testnet-api.delta.exchange/orders",
        headers: [
          {"api-key", @api_key},
          {"timestamp", timestamp},
          {"signature", signature},
          {"User-Agent", "rest-client"},
          {"Content-Type", "application/json"},
        ],
        options: [],
        params: %{},
        body: payload
      }

      response = HTTPoison.request(request)
      IO.inspect(response)
      IO.puts("Decoded")

    end

    def get_request do

        IO.puts("Request hit")
        # response = HTTPoison.get!(
        #     "https://api.delta.exchange/products"
        # )
        
        request = %HTTPoison.Request{
            method: :get,
            url: 'https://api.delta.exchange/products/ticker/24hr',
            headers: [{"Accept", "application/json"}],
            options: [],
            params: %{:symbol => :string}
          }

        response = HTTPoison.request(request)
        
        # :crypto.hmac(:sha256, "key", "message") |> Base.encode16
          
        IO.puts("YES, I am here")
        IO.puts(is_map(response))
        # IO.puts(response[:body])
        IO.inspect(response)
        # keys = Map.keys(response)
        # ans = Map.fetch!(response, :status_code)
        # IO.inspect(keys)
        # IO.inspect(is_integer(ans))
        
        IO.puts("Decoded")
        # req = Poison.decode!(response.body)
        
        # IO.puts(req)
    end

  end