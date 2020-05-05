defmodule Trade.Supervisor do 
    use Supervisor
    alias Trade.Server

    def start_link do
        Supervisor.start_link(__MODULE__, [])
    end

    def init(_) do 
        children = [
            worker(Server, [])
        ]

        IO.puts("I am in Trade Supervisor")

        Supervisor.init(children, strategy: :one_for_one)
    end

end