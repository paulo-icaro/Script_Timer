# ================= #
# ===== TIMER ===== #
# ================= #

# --- Script by Paulo Icaro --- #


# ----------------- #
# --- Libraries --- #
# ----------------- #
library(devtools)               # In case the scripts are from github



# ------------------ #
# --- Timer Full --- #
# ------------------ #
timer_full = function(script_path){
  
  # 1° Step - Script Execution and Start/End Intervals #
  start = Sys.time()
  source(script_path)
  end = Sys.time()
  
  
  
  
  # 2° Step - Accessing some date and time parameters #
  
  # Start 
  start_day = day(x = start)
  start_hour = hour(x = start)
  start_min = minute(x = start)
  start_sec = second(x = start)

  # End
  end_day = day(x = end)
  end_hour = hour(x = end)
  end_min = minute(x = end)
  end_sec = second(x = end)
  
  
  
  
  # 3° Step - Compute execution time
  flag = 0
  
  # Condition 1: Seconds Code
  if(end_sec >= start_sec){script_sec = end_sec - start_sec} else {script_sec = end_sec + (60 - start_sec)}
  if(script_sec != 0){flag = 1 + flag}
  
  # Condition 2: Minutes Code
  if(end_min >= start_min){script_min = end_min - start_min} else {script_min = end_min + (60 - start_min)}
  if(script_sec != 0){flag = 5 + flag}
  
  # Condition 3: Hours Code  
  if(end_hour >= start_hour){script_hour = end_hour - start_hour} else {script_hour = end_hour + (24 - start_hour)}
  if(script_hour != 0){flag = 10 + flag}
  
  # Condition 4: Days Code
  if(end_day >= start_day){script_day = end_day - start_day}
  if(script_day != 0){flag = 20 + flag}
  
  
  
  
  # 4° Step - Outputs
  if(flag == 1){print(x = paste0('The full script took only ', round(script_sec), 's'))}
  if(flag == 6){print(x = paste0('The full script took ', script_min, 'm ', round(script_sec), 's'))}
  if(flag == 16){print(x = paste0('The full script lasted ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's'))}
  if(flag == 36){print(x = paste0('The full script lasted ', script_day, 'd ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's'))}
}





# ----------------------- #
# --- Timer - Snippet --- #
# ----------------------- #
timer_snippet = function(start, end){
  
  # 1° Step - Accessing some date and time parameters #
  
  # Start 
  start_day = day(x = start)
  start_hour = hour(x = start)
  start_min = minute(x = start)
  start_sec = second(x = start)
  
  # End
  end_day = day(x = end)
  end_hour = hour(x = end)
  end_min = minute(x = end)
  end_sec = second(x = end)
  
  
  
  
  # 2° Step - Compute execution time
  flag = 0
  
  # Condition 1: Seconds Code
  if(end_sec >= start_sec){script_sec = end_sec - start_sec} else {script_sec = end_sec + (60 - start_sec)}
  if(script_sec != 0){flag = 1 + flag}
  
  # Condition 2: Minutes Code
  if(end_min >= start_min){script_min = end_min - start_min} else {script_min = end_min + (60 - start_min)}
  if(script_sec != 0){flag = 5 + flag}
  
  # Condition 3: Hours Code  
  if(end_hour >= start_hour){script_hour = end_hour - start_hour} else {script_hour = end_hour + (24 - start_hour)}
  if(script_hour != 0){flag = 10 + flag}
  
  # Condition 4: Days Code
  if(end_day >= start_day){script_day = end_day - start_day}
  if(script_day != 0){flag = 20 + flag}
  
  
  
  
  # 3° Step - Outputs
  if(flag == 1){print(x = paste0('This snippet took only ', round(script_sec), 's'))}
  if(flag == 6){print(x = paste0('This snippet took ', script_min, 'm ', round(script_sec), 's'))}
  if(flag == 16){print(x = paste0('This snippet lasted ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's'))}
  if(flag == 36){print(x = paste0('This snippet took ', script_day, 'd ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's'))}
}