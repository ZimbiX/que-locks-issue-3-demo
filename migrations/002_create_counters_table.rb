Sequel.migration do
  change do
    create_table(:counters) do
      String :id, primary_key: true
      Integer :n
    end
  end
end
