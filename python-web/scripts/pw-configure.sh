# create the web page to serve
cat > index.html << eof

  hello world.
  <p>
  i am ${hostname}
  <p>
  created at: `date`
  <p>
  i am running at ${hostname}, with on-box ip configuration:
  <pre>
  `ifconfig | grep inet`
  </pre>
  
  eof


