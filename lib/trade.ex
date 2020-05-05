defmodule Trade do
  use Application

  def start(_type, _args) do 
    Trade.Main.Supervisor.start_link
  end

end
