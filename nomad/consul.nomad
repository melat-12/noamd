consul.nomad
 job "consul"{
     datacenters=["dc1"]
     group "consul"{
         count=1
         task "consul"{
            
         driver="raw_exec"
          config{
              command="consul"
              arg=["agnet","-dev"]
          }
          artifact{
              source="https://realses.hasicorp.com/consul/1.6.2/consul_1.6.2_darwin_amd64.zip"
          }
         }
     }
 }