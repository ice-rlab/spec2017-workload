!/bin/bash
jobs=(
  "/perf ./intrate.sh 505.mcf_r --copies 1"
  "/perf ./intrate.sh 520.omnetpp_r --copies 1"
  "/perf ./intrate.sh 523.xalancbmk_r --copies 1"
  "/perf ./intrate.sh 525.x264_r --copies 1"
  "/perf ./intrate.sh 531.deepsjeng_r --copies 1"
  "/perf ./intrate.sh 541.leela_r --copies 1"
  "/perf ./intrate.sh 548.exchange2_r --copies 1"
  "/perf ./intrate.sh 557.xz_r --copies 1"
  "/perf ./intrate.sh 500.perlbench_r --copies 1"
)


mkdir -p /cpi/

# Iterate through the jobs array and execute each command.
for job_command in "${jobs[@]}"; do
  echo "Executing: $job_command"
  eval "$job_command" # Use eval to execute the command string.
  if [ $? -ne 0 ]; then
    echo "Command '$job_command' failed with exit code $?. Continuing..."
  fi
done

echo "All jobs completed."
exit 0
