# #Framwork start up

assert = require 'cassert'
fs = require 'fs'
path = require 'path'

# Setup the environment
env =
  logger: require './lib/logger'
  devices: require './lib/devices'
  rules: require './lib/rules'
  plugins: require './lib/plugins'
  actions: require './lib/actions'
  predicates: require './lib/predicates'
  matcher: require './lib/matcher'
  require: (args...) -> module.require args...

# set the config file to
configFile = (
  # PIMATIC_CONFIG envirement variable if it is set
  if process.env.PIMATIC_CONFIG? then process.env.PIMATIC_CONFIG 
  # or get the config the parent folder of node_modules
  else path.resolve __dirname, '../../config.json'
)

# Setup the framework
Framework = (require './lib/framework') env 
framework = new Framework configFile
promise = framework.init()
promise.done()

module.exports.framework = framework