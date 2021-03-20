defmodule ReportsHours do
  alias ReportsHours.Parser

  def build do
    "report/gen_report.csv"
    |> Parser.parse_file()
    |> Enum.reduce(initial_report(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values(line, report) do
    all_hours = sum_all_hours(line, report.all_hours)
    hours_per_month = sum_hours_per_month(line, report.hours_per_month)

    build_report(all_hours, hours_per_month)
  end

  defp sum_all_hours([name, hours, _day, _month, _year], all_hours) do
    previous_hours = Map.get(all_hours, name, 0)

    Map.put(all_hours, name, hours + previous_hours)
  end

  defp sum_hours_per_month([name, hours, _day, month, _year], hours_per_month) do
    previous_historic = Map.get(hours_per_month, name, %{})
    previous_hours_month = Map.get(previous_historic, month, 0)

    new_month = Map.put(previous_historic, month, hours + previous_hours_month)

    Map.put(hours_per_month, name, new_month)
  end

  defp build_report(all_hours, hours_per_month) do
    %{
      all_hours: all_hours,
      hours_per_month: hours_per_month
    }
  end

  defp initial_report do
    %{
      all_hours: %{},
      hours_per_month: %{},
      hours_per_year: %{}
    }
  end
end
