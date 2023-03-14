# FROM ubuntu

# EROR

# RUN apt update && apt upgrade -y && apt install python3 -y && install git -y && get install nmap -y 
# # && apt-utils

# RUN apt install pip  -y

# RUN git clone https://github.com/k4m4/kickthemout.git

# # Poder cambiar el actual directorio de trabajo
# WORKDIR /kickthemout

# # COPY menubasewhile.sh /home/

# RUN pip3 install -r requirements.txt

# CMD python3 kickthemout.py

# BIEN

FROM ubuntu

RUN apt update && apt upgrade -y && apt install -y python3 git nmap python3-pip
# && apt-utils

RUN git clone https://github.com/k4m4/kickthemout.git

# Cambiar el directorio de trabajo actual
WORKDIR /kickthemout

# COPY menubasewhile.sh /home/

RUN pip3 install --no-cache-dir -r requirements.txt

CMD python3 kickthemout.py
