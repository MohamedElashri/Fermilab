## I'm using this dataset for each 29th subrun in 20753-32397 runs:
Dataset definition 'melashri_slowmon_epoch2_29SubRuns' has been created with id 4884171
## I create it using command 
samweb create-definition melashri_slowmon_epoch2_29SubRuns "run_number 20753-32397 and Online.Subrun 29 and online.detector fardet and online.stream DDslowmono and data_tier=raw"


# The good one is

## I'm using this dataset for each 29th subrun in 20753-23419 runs:
Dataset definition 'melashri_slowmon_epoch2_20753-23419_29SubRuns' has been created with id 4884191

## I create it using command 

samweb create-definition melashri_slowmon_epoch2_20753-23419_29SubRuns "run_number 20753-23419 and Online.Subrun 29 and online.detector fardet and online.stream DDslowmono and data_tier=raw"


# for test purposes

## using this for test grid jobs
Dataset definition 'melashri_slow_s29_test' has been created with id 4893651

## created with 
samweb create-definition melashri_slow_s29_test "run_number 20753 and Online.Subrun 29 and online.detector fardet and online.stream DDslowmono and data_tier=raw"


# good test with root files 

## This is the correct format for monojob.sh grid script 

Dataset definition 'melashri_slowmonopole_epoch2_root_test' has been created with id melashri_slowmonopole_epoch2_root_test

## created with 
samweb create-definition melashri_slowmonopole_epoch2_root_test "online.detector fardet and data_stream ddslowmono and online.runnumber >= 20753 and online.runnumber <= 20800 and Online.Subrun 29 and data_tier artdaq"


## This is the correct format for monojob.sh grid script and analysis 
Dataset definition 'melashri_slowmonopole_epoch2_root' has been created with id 4896831


## created with 

novagpvm06:submit_grid> samweb create-definition melashri_slowmonopole_epoch2_root "online.detector fardet and data_stream ddslowmono and online.runnumber >= 20753 and online.runnumber <= 22019 and Online.Subrun 29 and data_tier artdaq"


## MC fcl datasaet 
melashri_slownone_MC_gain_150_trial_8 

## MC fcl dataset
melashri_MC_slowmono_testfile
