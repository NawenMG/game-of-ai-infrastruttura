# Installare Podman
package 'podman'

# Installare Ruby, Node.js, e le dipendenze per Rails e Angular
package %w{ ruby ruby-dev nodejs npm }

# Installare Redis
podman_run 'redis' do
  image 'redis:latest'
  ports ['6379:6379']
end

# Installare PostgreSQL con Podman
podman_run 'postgres' do
  image 'postgres:latest'
  env ['POSTGRES_PASSWORD=mysecretpassword']
  ports ['5432:5432']
end

# Installare MongoDB con Podman
podman_run 'mongodb' do
  image 'mongo:latest'
  ports ['27017:27017']
end

# Installare InfluxDB con Podman
podman_run 'influxdb' do
  image 'influxdb:latest'
  ports ['8086:8086']
end

# Installare RethinkDB con Podman
podman_run 'rethinkdb' do
  image 'rethinkdb:latest'
  ports ['8080:8080']
end

# Installare Cassandra con Podman
podman_run 'cassandra' do
  image 'cassandra:latest'
  ports ['9042:9042']
end

# Installare ArangoDB con Podman
podman_run 'arangodb' do
  image 'arangodb:latest'
  ports ['8529:8529']
end

# Installare Kafka con Podman
podman_run 'kafka' do
  image 'confluentinc/cp-kafka:latest'
  ports ['9092:9092']
end

# Installare NiFi con Podman
podman_run 'nifi' do
  image 'apache/nifi:latest'
  ports ['8080:8080']
end

# Installare Kong con Podman
podman_run 'kong' do
  image 'kong:latest'
  ports ['8000:8000', '8443:8443']
end
