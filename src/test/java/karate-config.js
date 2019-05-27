function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
	baseUrl: 'http://localhost:5000',
    token:""
  }

  if (env == 'dev') {
    // customize
    config.baseUrl = 'https://dev.fusemachines.com/'
  } else if (env == 'e2e') {
    // customize
    config.baseUrl = 'https://stage.fusemachines.com/'
  }

   //Calling the token only once
     var credit = {username: "peter@klaven", password: "cityslicka", burl: config.baseUrl};
     var signIn = karate.callSingle('classpath:alltests/getToken.feature', credit);
     config.token = signIn.token

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);
  return config;
}