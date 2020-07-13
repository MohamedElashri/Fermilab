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

## Complete Analysis Data 
melashri_slowmonopole_epoch2_150_gain

### created with 
samweb create-definition melashri_slowmonopole_epoch2_150_gain "online.detector fardet and data_stream ddslowmono and online.runnumber >= 20753 and online.runnumber <= 23419 and Online.Subrun 29 and data_tier artdaq"

# FCL datasets 

## to test MC generation (one file)
test_slowmono_grid_150_gain_MC

### created by 
sam_add_dataset --data_tier=fcl -d /pnfs/nova/scratch/users/melashri/gen_fcls/test -n test_slowmono_grid_150_gain_MC


# Esong MC 

melashri_slowmonopole_MC_5ms_snews_beta_1e-4_to_beta_1e-3

##created with 
samweb create-definition melashri_slowmonopole_MC_5ms_snews_beta_1e-4_to_beta_1e-3 "defname:esong_merged_monopole_and_5ms_cosmic_gain100_birksmodB_lowdedx_S16-10-07_beta1e-4to8e-1_20170228 and file_name like '%e-04_birksmod%' or file_name like '%e-03_birksmod%'"

## overlay test dataset generation 
novagpvm07:melashri> sam_add_dataset --data_tier=fcl -n melashri_overlay_test_3 -d /pnfs/nova/scratch/users/melashri/overlay/
WARNING:root:the dataset with name melashri_overlay_test_3 was created

## overlayed MC test dataset  

melashri_MC_overlay_High_gain_test

## created with 
sam_add_dataset --data_tier=artdaq  -d  /pnfs/nova/persistent/users/melashri/test_overlay -n melashri_MC_overlay_High_gain_test
