config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'environment_variables.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end