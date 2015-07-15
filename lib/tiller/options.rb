def parse_options(config)
  optparse = OptionParser.new do |opts|
    opts.on('-n', '--no-exec', 'Do not execute a replacement process') do
      config[:no_exec] = true
    end
    opts.on('-v', '--verbose', 'Display verbose output') do
      config[:verbose] = true
    end
    opts.on('-d', '--debug', 'Display debug output') do
      config[:debug] = true
    end
    opts.on('-a', '--api', 'Enable HTTP API') do
      config['api_enable'] = true
    end
    opts.on('-p', '--api-port [API_PORT]', 'HTTP API port') do |api_port|
      config['api_port'] = api_port
    end
    opts.on('-b', '--base-dir [BASE_DIR]', 'Override the tiller_base environment variable') do |base_dir|
      config[:tiller_base] = base_dir
    end
    opts.on('-l', '--lib-dir [LIB_DIR]', 'Override the tiller_lib environment variable') do |lib_dir|
      config[:tiller_lib] = lib_dir
    end
    opts.on('-e', '--environment [ENV]', 'Override the \'environment\' environment variable') do |environment|
      config[:environment] = environment
    end

    opts.on('-h', '--help', 'Display this screen') do
      puts opts
      puts 'Tiller also uses the environment variables tiller_base, environment'
      puts 'and tiller_lib (or they can be provided using the arguments shown above).'
      puts 'See https://github.com/markround/tiller for documentation and usage.'
      puts 'Current configuration hash follows :'
      pp config
      exit
    end
  end

  optparse.parse!

  config
end