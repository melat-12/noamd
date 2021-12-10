http-echo-dynamic-service.nomad
job "http-echo"{
     datacentres=["dc1"]
     group "echo"{
         count=5
         task"server"{
         driver="docker"
         config{
             image="hashicorp/http-echo:latest"
             args=[
                 "-listen",:"8080",
                 "-text","hello and welcome to ${NOMAD_IP_http} running on port ${NOMAD_PORT_http}"
             ]
         }
             resources{
                 network{
                     mbits=10
                     port "http"{}
                 }
             }
             service{
                 name="http-echo"
                 port="http"
                 tags=[
                     "hp"
                     "urlprefix-/http-echo",
                 ]
              check{
                  type="http"
                  path="/health"
                  interval="2s"
                  timeout="2s"
              }   
             }
         
         }
     }