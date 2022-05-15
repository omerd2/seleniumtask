FROM debian:buster
ARG WEB_URL

#Downloading & installing Python3.7 + Selenium module +Firefox browser
RUN apt update && apt upgrade && \
    apt-get install -y wget vim build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev firefox-esr&& \
    cd /usr/src &&  wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz && tar xzf Python-3.7.9.tgz && cd Python-3.7.9 && ./configure --enable-optimizations && make altinstall && \
    pip3.7 install -U selenium

#Downloading & installing Gecko driver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz && \
    tar -xvf geckodriver-v0.31.0-linux64.tar.gz && mv geckodriver /usr/local/bin/ && rm -rf geckodriver-v0.31.0-linux64.tar.gzz && \
    cd /usr/local/bin/ && chmod +x geckodriver && export PATH=$PATH:/usr/local/bin/geckodriver 


#Copy the python script into the Docker image
COPY scrnsht.py /scrnsht.py

#Execute permission for Python script.
RUN chmod +x /scrnsht.py


CMD ["sh", "-c", "python3.7 scrnsht.py $WEB_URL"][odahan@devops-jumpstation blabla]$ cat Dockerfile
FROM debian:buster
ARG WEB_URL

#Downloading & installing Python3.7 + Selenium module +Firefox browser
RUN apt update && apt upgrade && \
    apt-get install -y wget vim build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev firefox-esr&& \
    cd /usr/src &&  wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz && tar xzf Python-3.7.9.tgz && cd Python-3.7.9 && ./configure --enable-optimizations && make altinstall && \
    pip3.7 install -U selenium

#Downloading & installing Gecko driver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz && \
    tar -xvf geckodriver-v0.31.0-linux64.tar.gz && mv geckodriver /usr/local/bin/ && rm -rf geckodriver-v0.31.0-linux64.tar.gzz && \
    cd /usr/local/bin/ && chmod +x geckodriver && export PATH=$PATH:/usr/local/bin/geckodriver 


#Copy the python script into the Docker image
COPY scrnsht.py /scrnsht.py

#Execute permission for Python script.
RUN chmod +x /scrnsht.py


CMD ["sh", "-c", "python3.7 scrnsht.py $WEB_URL"]
