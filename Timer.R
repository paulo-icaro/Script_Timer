# ================= #
# ===== TIMER ===== #
# ================= #

# --- Script by Paulo Icaro --- #


# ----------------- #
# --- Libraries --- #
# ----------------- #
library(lubridate)          # Manipulation of dates
library(crayon)             # Format text outputs


# ------------------ #
# --- Timer Full --- #
# ------------------ #
timer = function(script, type = 'simple', name = NULL){


  # --- 1° Step - Script Execution and Start/End Intervals --- #
  # The conditional bellow checks whether the code is a full script, just a snippet of the previous option or it is just a simple code
  start = Sys.time()        # Start time
  if(type == 'full'){source(script)} else if(type == 'snippet'){eval(script)} else if(type == 'simple'){eval(script)} else {cat('Invalid "type" argument. The options are full, snippet and simple. Try again. \nArgumento "tipo" inválido. As opções são full, snippet e simples. Tente novamente.')}
  end = Sys.time()          # End time
  
  

  # --- 2° Step - Accessing some date and time parameters --- #
  # Start and End
  start_day = day(x = start)
  start_hour = hour(x = start)
  start_min = minute(x = start)
  start_sec = second(x = start)
  end_day = day(x = end)
  end_hour = hour(x = end)
  end_min = minute(x = end)
  end_sec = second(x = end)



  # --- 3° Step - Compute execution time --- #
  flag = 0
  
  # Condition 1: Seconds Code
  if(end_sec >= start_sec){
    script_sec = end_sec - start_sec
    script_min = 0
    } else {
    script_sec = end_sec + (60 - start_sec)
    script_min = -1
    }
  
  if(script_sec != 0){flag = 1 + flag}      # Flag
  
  # Condition 2: Minutes Code
  if(end_min >= start_min){
    script_min = script_min + end_min - start_min
    script_hour = 0
    } else {
    script_min = script_min + end_min + (60 - start_min)
    script_hour = -1
    }
  
  if(script_sec != 0){flag = 5 + flag}      # Flag
  
  # Condition 3: Hours Code  
  if(end_hour >= start_hour){
    script_hour = script_hour + end_hour - start_hour
    script_day = 0
  } else {
    script_hour = script_hour + end_hour + (24 - start_hour)
    script_day = -1
  }
  
  if(script_hour != 0){flag = 10 + flag}    # Flag
  
  # Condition 4: Days Code
  if(end_day >= start_day){script_day = script_day + end_day - start_day}
  if(script_day != 0){flag = 20 + flag}
  
  
  
  # --- 4° Step - Outputs --- #
  
  if(is.null(name) || name == ''){
    if(flag == 1){cat(paste0(if(type == 'full'){'The script took only '} else if(type == 'snippet'){'The snippet took only '} else {'The code took only '}, round(script_sec), 's.'))}
    if(flag == 6){cat(paste0(if(type == 'full'){'The script took '} else if(type == 'snippet'){'The snippet took '} else {'The code took '}, script_min, 'm ', round(script_sec), 's.'))}
    if(flag == 16){cat(paste0(if(type == 'full'){'The script lasted '} else if(type == 'snippet'){'The snippet lasted '} else {'The code lasted '}, script_hour , 'h ', script_min, 'm ', round(script_sec), 's.'))}
    if(flag == 36){cat(paste0(if(type == 'full'){'The script lasted '} else if(type == 'snippet'){'The snippet took '} else {'The code took '}, script_day, 'd ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's.'))}
  } else {
    if(flag == 1){cat(paste0(if(type == 'full'){paste0('The script ', italic(name), ' took only ')} else if(type == 'snippet'){paste0('The snippet ', italic(name), ' took only ')} else {paste0('The code ', italic(name), ' took only ')}, round(script_sec), 's.'))}
    if(flag == 6){cat(paste0(if(type == 'full'){paste0('The script ', italic(name), ' took ')} else if(type == 'snippet'){paste0('The snippet ', italic(name), ' took ')} else {paste0('The code ', italic(name), ' took ')}, script_min, 'm ', round(script_sec), 's.'))}
    if(flag == 16){cat(paste0(if(type == 'full'){paste0('The script ', italic(name), ' lasted ')} else if(type == 'snippet'){paste0('The snippet ', italic(name), ' lasted ')} else {paste0('The code ', italic(name), ' lasted ')}, script_hour , 'h ', script_min, 'm ', round(script_sec), 's.'))}
    if(flag == 36){cat(paste0(if(type == 'full'){paste0('The script ', italic(name), ' lasted ')} else if(type == 'snippet'){paste0('The snippet ', italic(name), ' took ')} else {paste0('The code ', italic(name), ' took ')}, script_day, 'd ', script_hour , 'h ', script_min, 'm ', round(script_sec), 's.'))}
  }
  
  # --- 5° Step - Cleansing --- #
  rm(start, end, flag)
}