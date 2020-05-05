defmodule Trade.Server do
    use GenServer

    def start_link do
        GenServer.start_link(__MODULE__, %{}, name: :request_server)
    end

    @impl true
    def init(_) do 
        {:ok, %{}}
    end

    def hit_request do 
        IO.puts("Its in hit request")
        
        # GenServer.call(:request_server, {:get_state})
        GenServer.cast(:request_server, {:get_state})

        IO.puts("GET request executed/executing depends on call/cast")
    end

    @impl true
    def handle_call({:get_state}, _from, my_states) do
        IO.puts("Its in handle call")
        Trade.Request.testnet_get_order_request()
        # Trade.Request.testnet_post_order_request()
        # Trade.Request.testnet_edit_order_request()
        # Trade.Request.testnet_delete_order_request()
        {:reply, my_states, my_states}
    end

    @impl true
    def handle_cast({:get_state}, my_states) do
        IO.puts("Its in handle cast")
        Trade.Request.testnet_get_order_request()
        # Trade.Request.testnet_post_order_request()
        # Trade.Request.testnet_edit_order_request()
        # Trade.Request.testnet_delete_order_request()
        {:noreply, my_states}
    end

end