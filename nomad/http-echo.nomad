http-echo.nomad
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
                 "-text","hello and welcome to 127.0.01 running on port 8080"
             ]
         }
             resources{
                 network{
                     mbits=10
                     port "http"{
                         static=8080
                     }
                 }
             }
         
         }
     }
 }