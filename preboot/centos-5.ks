install
text
key --skip
lang en_US.UTF-8
skipx
keyboard br-abnt2
mouse none
firewall --disabled
selinux --disabled
timezone America/Sao_Paulo
authconfig --enableshadow --enablemd5
rootpw abc123
firstboot --disabled
services  --disabled atd,cups,gpm,iptables,ip6tables,kudzu,yum-updatesd,mcstrans,messagebus,netfs,nfs,nfslock,portmap,haldaemon,avahi-daemon,xfs,dhclient,rhnsd,autofs,audit,isdn,mdmonitor,bluetooth,named
bootloader --location=mbr --driveorder=sda
firstboot --disable
zerombr yes
reboot

clearpart --all
part /boot --fstype ext3 --size=50 --ondisk=sda --asprimary
part pv.1 --size=0 --ondisk=sda --asprimary --grow
volgroup r7linux --pesize=32768 pv.1
logvol swap --fstype swap --name=swap1 --vgname=r7linux --fsoptions="pri=0" --size=512
logvol /    --fstype ext3 --name=root  --vgname=r7linux --fsoptions="noatime,nodev" --size=1024
logvol /var --fstype ext3 --name=var   --vgname=r7linux --fsoptions="noatime,nodev,nosuid" --size=2048 --grow
logvol /usr --fstype ext3 --name=usr   --vgname=r7linux --fsoptions="noatime,nodev" --size=3072
logvol /tmp --fstype ext3 --name=tmp   --vgname=r7linux --fsoptions="noatime,noexec,nosuid,nodev" --size=256
logvol /opt --fstype ext3 --name=opt   --vgname=r7linux --fsoptions="noatime,nodev" --size=1024

url --url http://192.168.0.1/pub/centos/5/os/i386/

%packages --ignoremissing
@core
@base
@editors
net-snmp
xinetd
postfix
strace
dstat
htop
ntp
sysstat
lynx
func
puppet
-talk
-finger
-xorg-x11-filesystem
-lftp
-words
-coolkey
-vconfig
-mdadm
-autofs
-sendmail
-conman
-pcmciautils
-cpuspeed
-NetworkManager
-rp-pppoe
-amtu
-smartmontools
-ccid
-anacron
-eject
-bluez-utils
-xorg-x11-xfs
