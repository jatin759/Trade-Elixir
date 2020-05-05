defmodule Trade.Main.Supervisor do 
    use Supervisor

    def start_link do 
        Supervisor.start_link(__MODULE__, [])
    end

    def init(_) do 
        children = [
            supervisor(Trade.Supervisor, [])
        ]
        IO.puts("I am in Main Supervisor")
        Supervisor.init(children, strategy: :one_for_all)
    end

end