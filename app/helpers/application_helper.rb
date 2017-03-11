module ApplicationHelper
  def dialect_select_options(selected)
    options_for_select([["Yoda", "yoda"], ["Valley Girl", "valley-girl"], ["Binary Code", "binary-code"]], selected)
  end
end
