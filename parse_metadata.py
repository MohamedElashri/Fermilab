#create dataset by selecting on time and trigger name
#then we can use groupby, sum, etc.
import argparse
import subprocess
from datetime import datetime
from tqdm import tqdm  # You need to install tqdm

parser = argparse.ArgumentParser(description="Process list of files to get metadata.")
parser.add_argument('input_file',  type=str, help='the input file which contains the list of files')
parser.add_argument('output_file', type=str, help='The output csv file which contains the metadata.')
args = parser.parse_args()


with open(args.input_file, "r") as raw_files, open(args.output_file,"w") as csv_file:
  #subprocess.check_output("samweb create-definition esong_ddfastmono_30960_and_more_raw  'online.detector fardet and online.stream DDfastmono and online.runnumber >= 30960 and data_tier raw'", shell=True)
  #subprocess.check_output("samweb take-snapshot esong_ddfastmono_30960_and_more_raw  ", shell=True)
  #subprocess.check_output("samweb list-files "dataset_def_name_newest_snapshot esong_ddfastmono_30960_and_more_raw" > raw_files.txt", shell=True)
  #subprocess.check_output("sort raw_files.txt -o raw_files.txt", shell=True)

  csv_file.write("run, subrun, SubRunStartTime, SubRunEndTime, SubRunDuration, SubRunStartDate, ActiveDCMs, BufferNodeList, TotalEvents, FileSize\n")
  for raw_file in tqdm(raw_files.readlines()):
  #for raw_file in tqdm(["fardet_r00030960_s00_DDfastmono.raw"]):
    metadata=subprocess.check_output('samweb -e nova get-metadata {}'.format(raw_file), shell=True).split("\n")
    ActiveDCMs=""
    BufferNodeList=""
    for meta in metadata:
      if meta.find("RunNumber")>-1:
        run=meta.split(":")[1]
      if meta.find("Subrun")>-1:
        subrun=meta.split(":")[1]
      if meta.find("SubRunStartTime")>-1:
        SubRunStartTime=meta.split(":")[1]
      if meta.find("SubRunEndTime")>-1:
        SubRunEndTime=meta.split(":")[1]
      if meta.find("ActiveDCMs")>-1:
        ActiveDCMs=meta.split(":")[1]
      if meta.find("BufferNodeList")>-1:
        BufferNodeList=meta.split(":")[1]
      if meta.find("TotalEvents")>-1:
        TotalEvents=meta.split(":")[1]
      if meta.find("File Size")>-1:
        FileSize=meta.split(":")[1]
    SubRunDuration = str(int(SubRunEndTime) - int(SubRunStartTime))
    SubRunStartDate = datetime.utcfromtimestamp(int(SubRunStartTime)).strftime('%Y-%m-%d')
    row=",".join([run, subrun, SubRunStartTime, SubRunEndTime, SubRunDuration, SubRunStartDate, ActiveDCMs, BufferNodeList, TotalEvents, FileSize ])
    #print(row)
    csv_file.write(row+"\n")

#datetime.utcfromtimestamp(1418223936).strftime('%Y-%m-%d %H:%M:%S')
#File Size: 1093693760
#Event Count
#Start Time: 2014-12-10T15:02:03+00:00
#End Time: 2014-12-10T15:05:36+00:00
#Online.RunNumber: 30960
#Online.Subrun: 0
#Online.Stream: DDfastmono
#Online.ActiveDCMs: dcm-2-13-11
#Online.BufferNodeList: 10 11 13 14 15 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 56 58 60 61 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 93 94 95 96 97 98 99 118
#Online.Stream: DDfastmono
#Data Stream: ddfastmononn
#Online.Stream: DDFastMonoNN
#Online.TotalEvents: 1049
