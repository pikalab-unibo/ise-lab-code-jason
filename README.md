Project structure:
```
./                          # current dir
├─── build.gradle.kts       # top-level gradle configuration script
├─── gradle.properties      # default gradle properties, do not delete
├─── gradlew(.bat)          # build script
├─── settings.gradle        # gradle modules declarations
├─── gradle                 # gradle runtime, do not delete
│   └─── ...
├─── helloworld             # `helloworld` module (example 1)
│   ├─── build.gradle.kts   # project-specific gradle configuration script
│   ├─── helloworld.mas2j   # file describing the "helloworld" MAS 
│   └─── src
│       └─── main
│           ├─── asl        # folder containing Jason sources for the "helloworld" MAS
│           └─── java       # folder containing Java sources for the "helloworld" MAS
├─── computation            # `computation` module (example 2)
│   └─── ...                # same structure of `helloworld`
├─── interaction            # `interaction` module (example 3)
│   └─── ...                # same structure of `helloworld`
├─── fanboy                 # `fanboy` module (example from Jason book)
│   └─── ...                # same structure of `helloworld`
├─── domotic                # `domotic` module (example from Jason book)
│   └─── ...                # same structure of `helloworld`
├─── contractnet            # `contractnet` module (example from Jason book)
│   └─── ...                # same structure of `helloworld`
├─── thermostat             # `thermostat` module (example 4)
│   └─── ...                # same structure of `helloworld`
└─── robots                 # `robots` module (exercise 5)
    └─── ...                # same structure of `helloworld`
```

Jason Book PDF can be found through Google:
> https://www.google.com/search?q=programming%20multi-agent%20systems%20in%20agentspeak%20using%20jason

Each module may contain one or more `*.mas2j` files.
Consider for instance module `helloworld` which contains `helloworld.mas2j`.

The MAS described by `X.mas2j` can be run through the task `run<X>Mas` (where `X` is capitalised).
So for instance, `helloworld.mas2j` can be run as through the following command:
```bash
./gradlew runHelloworldMas
```
