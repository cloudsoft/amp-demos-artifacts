# create the web page to serve
cat > /tmp/index.html << eof

  hello world.
  <p>
  i am ${HOSTNAME}
  <p>
  created at: `date`
  <p>
  i am running at ${HOSTNAME}, with on-box ip configuration:
  <pre>
  `ifconfig | grep inet`
  </pre>

eof


