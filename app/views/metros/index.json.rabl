collection @metros, :root => "metros"
attributes :id,
    :cbsa_name

node(:id) { |metro| metro.cbsa }