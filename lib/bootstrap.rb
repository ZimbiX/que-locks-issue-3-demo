$LOAD_PATH << __dir__

require 'que'
require 'que/locks' if ENV['QUE_LOCKS'] == 'true'
require 'sequel'
require 'my_app/jobs/increment'

DB = Sequel.connect(
  "postgresql://localhost:5432/postgres?user=postgres&password=qwerty",
  keep_reference: false,
  max_connections: 10,
)

Que.connection = DB
