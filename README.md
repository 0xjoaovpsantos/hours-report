# ReportsHours

Ten people freelaxed for a company X for five years and the history with all the data of each one of these people (name, hours worked, day, month and year) were transferred to a CSV file in the following order: name, hours of work the day (which will vary from 1 to 8 hrs), day (which will vary from 1 to 30 even for the month of February and without leap years) referring to the hours of work, month and year (which goes from 2016 to 2020 ). In short: name, number of hours, day, month and year.

## Installation

To install the Elixir environment, follow the guidelines in the <a href="https://elixir-lang.org/install.html">official documentation.</a>

## Run the tests

In the project directory execute:

```bash
mix test
```

## Running the project

In the project directory execute:

```bash
mix compile
iex -S mix
```

By executing the previous command, you will be inside <a href="https://hexdocs.pm/iex/IEx.html">iex</a>, which is the elixir's interactive shell. Then you will be able to run the program:

```elixir
ReportsHours.build("gen_report.csv")
```