fabio.nomad
 job "fabio"{
     datacenters=["dc1]
     group "fabio"{
      count=1
      task "fabio"{
      driver ="raw_exec"
      config{
          command="fabio"
          args=["-proxy.strategy=rr"]
             }
        artifact{
              source="https://github.com/fabiolb/fabio/realses/download/v1.5.13/fabio-1.5.13-go1.13.4-.2_darwin_amd64"
              destination="local/fabio"
              node="file"
             }
          }
     }
 }