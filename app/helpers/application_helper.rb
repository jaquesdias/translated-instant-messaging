module ApplicationHelper
  def dialect_select_options(selected)
    options_for_select([["Yoda", "yoda"], ["Valley Girl", "valspeak"], ["Pirate", "pirate"]])
  end
end
