#!/usr/bin/bash


echo "Select log file to analyze:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

case $choice in
  1) logfile="hospital_data/active_logs/heart_rate.log" ;;
  2) logfile="hospital_data/active_logs/temperature.log" ;;
  3) logfile="hospital_data/active_logs/water_usage.log" ;;
  *) echo "Invalid option"; exit 1 ;;
esac

echo "Analysis on $(date)" >> reports/analysis_report.txt
awk '{print $2}' "$logfile" | sort | uniq -c >> reports/analysis_report.txt
echo "---------------------" >> reports/analysis_report.txt


