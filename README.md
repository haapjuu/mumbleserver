# qwerty
**Assignment H5:** http://terokarvinen.com/2018/aikataulu-%E2%80%93-palvelinten-hallinta-ict4tn022-4-ti-5-ke-5-loppukevat-2018-5p


For this little assignment the idea was to make a salt state that installs and configures a Mumble server and the necessary firewall port for the slave machine.


## **Instructions**

1. Use the command "wget https://raw.githubusercontent.com/haapjuu/qwerty/master/run.sh" in terminal to get the bash script from this repository.

2. Run the bash script with the command "bash run.sh".


### **Tehtävässä käytetyt laittet**

&nbsp;&nbsp;&nbsp;&nbsp;HP ProBook 655 G2 (Xubuntu 16.04 LTS x64)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Virtuaalipalvelin Digital Oceanilta (Xubuntu 16.04 LTS x64)
<br/>
<br/>

<br/>

Mumble palvelimen asennus itsessään oli yllättävän nopeaa ja helppoa. Suurimmat haasteet tehtävässä tulivat Githubin käyttämisen ja valmiin salt staten ajamiseen tarvittavan automaation opettelemisessa.
<br/>
Ensimmäiseksi ajettava "_run.sh_" skripti asentaa laitteelle Gitin ja salt-minionin. Seuraavaksi laitteelle kloonautuu Github repositoryni _"qwerty"_ joka sisältää loput komentojen suorittamisessa tarvittavat tiedostot. Ajettavasta koneesta tehdään itsensä mestari saltissa komennolla
```
echo 'master: localhost'|sudo tee /etc/salt/minion
```
Github repon cloonauksen jälkeen scripti bashaa kyseisen repon mukana tulleen "_highstate.sh_" skriptin, joka ajaa itse lopullisen salt staten komennolla
```
sudo salt-call --local --file-root srv/salt/ --pillar-root srv/pillar/  state.apply mumble
```
Vielä lopuksi ajetaan muutamia asetuksia järjestelmään ja Githubiin
```
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
git config --global user.email "email"
git config --global user.name "username"
```



**Lähteet:**

&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/terokarvinen/sirotin<br/>
&nbsp;&nbsp;&nbsp;&nbsp;https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html<br/>
&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/saltstack/salt/blob/develop/doc/topics/tutorials/starting_states.rst<br/>
