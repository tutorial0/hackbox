FROM kalilinux/kali-linux-docker

RUN echo "deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" > /etc/apt/sources.list && \
echo "deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
RUN apt update -y
RUN apt install -y git python2.7 python3.5 g++ gcc gdb make kali-linux-top10 kali-linux-web tree nload htop
WORKDIR /root
RUN echo "alias ll='ls -l'" > .bashrc
#RUN source .bashrc
RUN alias ll='ls -l'
RUN mkdir infomation_gather
WORKDIR infomation_gather
RUN git clone https://github.com/maurosoria/dirsearch.git
RUN git clone https://github.com/lijiejie/IIS_shortname_Scanner.git
RUN git clone https://github.com/sunnyelf/cheetah.git
RUN git clone https://github.com/lauixData/leakPasswd.git
RUN git clone https://github.com/kev169/theHarvester-1.git
RUN git clone https://github.com/ring04h/weakfilescan.git
RUN git clone https://github.com/ring04h/wydomain.git
RUN git clone https://github.com/lijiejie/BBScan.git
RUN git clone https://github.com/lijiejie/GitHack.git
RUN git clone https://github.com/anantshri/svn-extractor.git
RUN git clone https://github.com/lijiejie/ds_store_exp.git
RUN git clone https://github.com/lijiejie/subDomainsBrute.git
RUN git clone https://github.com/bit4woo/Teemo.git
RUN git clone https://github.com/3xp10it/xcdn.git
RUN git clone https://github.com/RUB-SysSec/Password-Guessing-Framework.git
RUN git clone https://github.com/metac0rtex/GitHarvester.git
RUN sed -i "s/return '8.8.8.8'/return '223.5.5.5'/" Teemo/config.py
RUN git clone https://github.com/BugScanTeam/DNSLog.git
RUN git clone https://github.com/KibodWapon/NoEye.git
WORKDIR ../
RUN mkdir dicts
WORKDIR dicts
RUN git clone https://github.com/tennc/fuzzdb.git 
WORKDIR ../
RUN mkdir bruteforce
WORKDIR bruteforce
RUN git clone https://github.com/lijiejie/htpwdScan.git
RUN git clone https://github.com/lijiejie/OutLook_WebAPP_Brute.git
RUN git clone https://github.com/Mebus/cupp.git
WORKDIR ../
RUN mkdir exploit
WORKDIR exploit
RUN git clone https://github.com/coffeehb/Some-PoC-oR-ExP.git
RUN git clone https://github.com/cflq3/poc.git
RUN git clone https://github.com/lijiejie/struts2_045_scan.git
RUN git clone https://github.com/cr0hn/dockerscan.git
RUN git clone https://github.com/nanshihui/PocCollect.git
RUN git clone https://github.com/re4lity/RsyncCheck.git
RUN git clone https://github.com/sensepost/heartbleed-poc.git
RUN git clone https://github.com/chuhades/CMS-Exploit-Framework.git
RUN git clone https://github.com/beefproject/beef.git
WORKDIR ../
RUN mkdir others
WORKDIR others
RUN git clone https://github.com/cve-search/cve-search.git
RUN git clone https://github.com/fate0/getproxy.git
RUN git clone https://github.com/5alt/lianwifi.git
RUN git clone https://github.com/sechacking/scriptkid.git
RUN git clone https://github.com/offensive-security/exploit-database.git
WORKDIR ../
RUN mkdir intranet_pentest
WORKDIR intranet_pentest
RUN git clone https://github.com/hmgle/socks5_c.git
RUN git clone https://github.com/CaiJiJi/VulScritp.git
RUN git clone https://github.com/blinking-yan/tencent_exmail.git
RUN git clone https://github.com/nitscan/inlinux.git
RUN git clone https://github.com/yuxiaokui/Intranet-Penetration.git
RUN git clone https://github.com/lijiejie/WIFIpass.git
RUN git clone https://github.com/trist725/s5relay.git
RUN git clone https://github.com/lijiejie/chromePass.git
RUN git clone https://github.com/sensepost/reGeorg.git
RUN git clone https://github.com/inconshreveable/ngrok.git
RUN git clone https://github.com/felix021/ssocks5.git
RUN git clone https://github.com/koto/xsschef.git
WORKDIR ../
RUN mkdir anti_hack
WORKDIR anti_hack
RUN git clone https://github.com/yongchuan/msafe.git
WORKDIR ../
RUN mkdir big_scanner
WORKDIR big_scanner
RUN git clone https://github.com/golismero/golismero.git
RUN git clone https://github.com/Arachni/arachni.git
RUN git clone https://github.com/sullo/nikto.git
RUN git clone https://github.com/wpscanteam/wpscan.git
WORKDIR ../

RUN apt upgrade -y
RUN sed -i "s/#Port 22/Port 22/" /etc/ssh/sshd_config
RUN sed -i "s/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/" /etc/ssh/sshd_config
#RUN sed -i "s/#AuthorizedKeysFile	\.ssh\/authorized_keys .ssh\/authorized_keys2/authorized_keys/AuthorizedKeysFile	.ssh\/authorized_keys/" /etc/ssh/sshd_config
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
RUN sed -i "s/#Port 22/Port 22/" /etc/ssh/sshd_config
RUN /etc/init.d/ssh start

RUN ifconfig
RUN echo "root:toor" | chpasswd

EXPOSE 22 53 8000 5000 21 80

ENTRYPOINT /bin/bash
