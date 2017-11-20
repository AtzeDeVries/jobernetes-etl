# Jobernetes config for NBA ETL

## Overview
This is a job config for running the NBA ETL in a jobernetes config. This config
runs the following jobs
* download source data
* bootstrapping indices
* importing the datasources
* enrich datasources
* import storage units
* merge indices (cleanup deleted documents)
* create snapshot

Note that this is only the config, not a deployment or job that can be directly inserted in kubernetes.

Sourcecode of the jobernetes project can be found here
```
https://github.com/AtzeDeVries/jobernetes
```

## Modifying
There are 3 things you should or could modify
* Jobmodel
* Container versions
* Source Data versions

### Jobmodel
This describes the way the ETL is run. It has multiple phases and within each phase
some jobs are done. Within a phase job depenencies van be made. For more info on how
to configure, check out the documentation of jobernetes.

### Container versions. 
The possible container versions of the ETL can be found here:
```
https://hub.docker.com/r/naturalis/nba-etl/tags/
```
The part before the `-` is the branch (or tag, if the build is on a tag) and
after the `-` is the short hash of a commit in the naturalis_data_api repository.
It makes sense to have versions of the containers the same. A easy way to change all the versions
is using find and sed
To change the container version from `V2.11.2-5a9d0f4` to `V2.11.3_dev-3f613b0` run 
```shell
find  -type f -print0 | xargs -0 sed -i 's/V2.11.2-5a9d0f4/V2.11.3_dev-3f613b0/g'
```
This will recursively change all jobs.

### Source Download
In the download jobs you can change the versions of the downloads. At the moment CRS is not fully
configured correctly.



