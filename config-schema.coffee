# #Configuration options 
# Lists all configuration options for the pimatic framework itself.
# For an example `config.json` file see the `config_default.json` file.

# Defines a `node-convict` config-schema and exports it.
module.exports =
  settings:
    locale:
      doc: "The default language"
      format: ['en', 'de', "es"]
      default: "en"
    debug:
      doc: "Turn on debug checks. Set the logLevel to debug to additional outputs"
      format: Boolean
      default: false
    authentication:
      username:
        doc: "The Username for http-basic-authentication"
        format: String
        default: ""
      password:
        doc: "The Password for http-basic-authentication"
        format: String
        default: ""
      enabled:
        doc: "Disable http-basic-authentication"
        format: Boolean
        default: true
      loginTime:
        doc: """The time in milliseconds to keep the session cookie if rememberMe is checked. 
        If 0 then delete the cookie on browser close.
        """
        format: Number
        default: 30 * 24 * 60 * 60 * 1000 #thirty days
    logLevel:
      doc: "The log level: debug, info, warn, error" 
      format: String
      default: "info"
    httpServer:
      enabled: 
        doc: "Should the http-server be started"
        format: Boolean
        default: true
      port:
        doc: "The port of the http-server"
        format: "port"
        default: 80
    httpsServer:
      enabled: 
        doc: "Should the https-server be started"
        format: Boolean
        default: false
      port:
        doc: "The port of the https-server"
        format: "port"
        default: 443
      # To generate a privatekey and a certificate run: 
      #  
      #     openssl genrsa -out privatekey.pem 1024
      #     openssl req -new -key privatekey.pem -out request.pem
      #     openssl x509 -req -in request.pem -signkey privatekey.pem -out certificate.pem
      #  
      keyFile:
        doc: "Privatekey-file"
        format: String
        default: "./.cert/privatekey.pem"
      certFile:
        doc: "Certification-file in pem-format"
        format: String
        default: "./.cert/certificate.pem"
  plugins:
    doc: "Array of plugins to load"
    format: Array
    default: []
  devices:
    doc: "Array of device definations"
    format: Array
    default: []
  rules:
    doc: "Array of rules"
    format: Array
    default: []