#!/bin/bash

#######################################
# Have fun with my Job Applicant
# Made by Maksim Kulikov, 2023
#######################################

## COLORS ##
# Reset
Color_Off='\033[0m'       # Text Reset

# Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Cyan='\033[0;36m'         # Cyan

## Directives ##

# links
echo -e "$Yellow \n Check connection to S3.. $Color_Off" && sleep 1.5 &&
wget -q --spider --timeout=2 --tries=2 https://s3.eu-west-3.amazonaws.com/max-k-one.site/public/resume
if [ $? -eq 0 ]; then
  echo -e "$Green \n Everything OK! $Color_Off" && sleep 1
  wget https://s3.eu-west-3.amazonaws.com/max-k-one.site/public/resume
else
  echo -e "$Red \n No connection... $Color_Off" ; sleep 1 ;
  exit
fi

wget -q --spider --timeout=2 --tries=2 https://s3.eu-west-3.amazonaws.com/max-k-one.site/public/resume_2
if [ $? -eq 0 ]; then
  wget https://s3.eu-west-3.amazonaws.com/max-k-one.site/public/resume_2
else
  echo -e "$Red \n No connection... $Color_Off" ; sleep 1 ;
  exit
fi

# Remove duplicate
find . -type f -name "resume.*" -delete && find . -type f -name "resume_2.*" -delete

## Main section ##

#case
echo -e "$Cyan \n Select language/Выберите языковой формат $Color_Off"
  echo "1 - Русский, 2 - English"
  read lang_sel
  case $lang_sel in
    1)
    sleep 1
    awk '{ printf "%c[1;31m \n", 27 }' <<< echo "" && awk 'NR==2{print}' resume;
    echo -e "$Yellow \n FULL_NAME $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^FULL_NAME/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n INFO $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^INFO/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n CONTACT $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^CONTACT/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n MY_WEBSITE $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^MY_WEBSITE/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n WORK_EXPERIENCE $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^WORK_EXPERIENCE/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 1ST ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n 2ND ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 3RD ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_3/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_3/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n 1ST EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 2ND EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n 3RD EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_3/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_3/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 1ST TRAINING $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^TRAINING_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Green \n 2ND TRAINING $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^TRAINING_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n LANGUAGES $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LANGUAGES/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n SKILLS $Color_Off" && sleep 0.3 && awk -v start="SKILLS:" -v end="VirtualBOX" \ 'index($0,start),index($0,end)' resume && sleep 3 ;
    echo -e "$Yellow \n 1ST LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_1/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 2ND LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_2/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;
    echo -e "$Yellow \n 3RD LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_3/{v=t($2)};END{printf "%s\n",v}' resume && sleep 1.5;

    find . -type f -name "resume" -delete && find . -type f -name "resume_2" -delete

    string=$(echo "THANKS_FOR_WATCHING")
    cols=$(tput cols)
    pos=0
    while true; do
      printf "\r"
      printf "%*s" $pos $string
      pos=$((pos+1))
      if [ $pos -gt $cols ]; then
        pos=0
      fi
      sleep 0.3
    done ;;
    2)
    sleep 1
    awk '{ printf "%c[1;31m \n", 27 }' <<< echo "" && awk 'NR==2{print}' resume_2;

    echo -e "$Yellow \n FULL_NAME $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^FULL_NAME/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n INFO $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^INFO/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n CONTACT $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^CONTACT/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n MY_WEBSITE $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^MY_WEBSITE/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n WORK_EXPERIENCE $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^WORK_EXPERIENCE/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 1ST ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n 2ND ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 3RD ORGANIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^ORGANIZATION_3/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n POSITION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^POSITION_3/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n 1ST EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 2ND EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n 3RD EDUCATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^EDUCATION_3/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n SPECIALIZATION $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^SPECIALIZATION_3/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 1ST TRAINING $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^TRAINING_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Green \n 2ND TRAINING $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^TRAINING_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n LANGUAGES $Color_Off" && sleep 0.3 && awk -F ':' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LANGUAGES/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n SKILLS $Color_Off" && sleep 0.3 && awk -v start="SKILLS:" -v end="VirtualBOX" \ 'index($0,start),index($0,end)' resume_2 && sleep 3 ;

    echo -e "$Yellow \n 1ST LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_1/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 2ND LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_2/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;
    echo -e "$Yellow \n 3RD LINK $Color_Off" && sleep 0.3 && awk '{ printf "%c[1;36m \n", 27 }' <<< echo "" && awk -F '>' 'function t(s){gsub(/[ \t]+$/," ",s);return s};/^LINK_3/{v=t($2)};END{printf "%s\n",v}' resume_2 && sleep 1.5;

    find . -type f -name "resume" -delete && find . -type f -name "resume_2" -delete

    string=$(echo "THANKS_FOR_WATCHING!")
    cols=$(tput cols)
    pos=0
    while true; do
      printf "\r"
      printf "%*s" $pos $string
      pos=$((pos+1))
      if [ $pos -gt $cols ]; then
        pos=0
      fi
      sleep 0.3
    done ;;
    *)
    echo -e "$Red \n error $Color_Off"
    find . -type f -name "resume" -delete && find . -type f -name "resume_2" -delete
    sleep 1
    esac
