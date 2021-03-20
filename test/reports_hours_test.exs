defmodule ReportsHoursTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "report_test.csv"

      response = ReportsHours.build(file_name)

      expected_response = %{
        all_hours: %{"Daniele" => 12, "Giuliano" => 3, "Mayk" => 5},
        hours_per_month: %{
          "Daniele" => %{abril: 7, dezembro: 5},
          "Giuliano" => %{feveiro: 3},
          "Mayk" => %{dezembro: 5}
        },
        hours_per_year: %{
          "Daniele" => %{"2016" => 5, "2018" => 7},
          "Giuliano" => %{"2017" => 3},
          "Mayk" => %{"2017" => 1, "2019" => 4}
        }
      }

      assert response == expected_response
    end
  end
end
