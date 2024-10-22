# original content from setenv.sh
# Modify the LD_LIBRARY_PATH so it includes the native libraries
LD_LIBRARY_PATH=$CATALINA_HOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

######################
# variables
######################

# env file to store generated values temporary
ENV_FILE="$CATALINA_HOME/bin/setenv_values.sh"

# prefix for secrets
PREFIX="BASE64_"

######################
# functions
######################

# function to decode secrets
set_secrets() {
  SECRET_VARS=$1 # list of secrets

  # decode secrets
  for i in $SECRET_VARS
    do # split key and value
      IFS='=' read -r key value <<< "$i"

      # remove prefix from key and decode value
      new_key=${key#"$PREFIX"}
      new_value=$(printenv $key | base64 -dw 0)

      # export new secret
      echo "export $new_key=\"$new_value\"" >> $ENV_FILE
  done
}

######################
# start of the script
######################

# prepare env file
echo "# generated values" > $ENV_FILE

# prepare secrets from environment variables, other variables are already set in the environment
set_secrets "$(env | grep -i "$PREFIX")"

### export all variables to the environment
source $ENV_FILE

### cleanup
rm $ENV_FILE

# set context.xml based on REDIS_HOST environment variable
if [ -n "$REDIS_HOST" ]; then
    cp "$CATALINA_HOME/conf-examples/context-redis.xml" "$CATALINA_HOME/conf/context.xml"
    echo "Using context-redis.xml"
else
    cp "$CATALINA_HOME/conf-examples/context-default.xml" "$CATALINA_HOME/conf/context.xml"
    echo "Using context-default.xml"
fi

# print the environment for debugging
#echo "Starting Tomcat with the following environment:"
#echo "-----------------------------------------------"
#printenv
#echo "-----------------------------------------------"
#echo "End of environment"